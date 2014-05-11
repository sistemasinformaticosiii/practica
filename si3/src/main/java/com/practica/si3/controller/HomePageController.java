package com.practica.si3.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.practica.si3.domain.CriterioBusqueda;
import com.practica.si3.domain.Oferta;
import com.practica.si3.domain.Reservation;
import com.practica.si3.domain.Subscription;
import com.practica.si3.domain.User;
import com.practica.si3.services.OfertaService;
import com.practica.si3.services.ReservationService;
import com.practica.si3.services.SubscriptionService;
import com.practica.si3.services.UserService;

@Controller
public class HomePageController {

	@Autowired
	UserService userService;
	@Autowired
	OfertaService ofertaService;
	@Autowired
	SubscriptionService subscriptionService;
	@Autowired
	ReservationService reservationService;
	

	@RequestMapping("/register")
	public ModelAndView registerUser(@ModelAttribute User user) {
		List<String> tipoList = new ArrayList<String>();
		tipoList.add("Entradas");
		tipoList.add("Restaurantes");
		tipoList.add("Actividades");

		List<String> perfilList = new ArrayList<String>();
		perfilList.add("Administrador");
		perfilList.add("Cliente");
		perfilList.add("Proveedor");

		Map<String, List> map = new HashMap<String, List>();
		map.put("tipoList", tipoList);
		map.put("perfilList", perfilList);
		return new ModelAndView("/administrador/register", "map", map);

	}
	
	@RequestMapping("/registerSubscription")
	public ModelAndView registerUser(@ModelAttribute Subscription subscription) {

		List<String> tipoList = new ArrayList<String>();
		tipoList.add("Entradas");
		tipoList.add("Restaurantes");
		tipoList.add("Actividades");

		Map<String, List> map = new HashMap<String, List>();
		map.put("tipoList", tipoList);
		return new ModelAndView("/suscripcion/registerSubscription", "map", map);
	}
	
	@RequestMapping("/registerOferta")
	public ModelAndView registerOferta(@ModelAttribute Oferta oferta) {

		List<String> tipoList = new ArrayList<String>();
		tipoList.add("Entradas");
		tipoList.add("Restaurantes");
		tipoList.add("Actividades");

		Map<String, List> map = new HashMap<String, List>();
		map.put("tipoList", tipoList);
		return new ModelAndView("/proveedor/registerOferta", "map", map);
	}
	
	@RequestMapping("/insert")
	public String inserData(@ModelAttribute User user) {
		
		if (!userService.existUser(user.getEmail()) && (user != null)) {
			userService.insertData(user);
			return "redirect:/getList";
		}
		else return "redirect:/errorUser";
	}
	
	@RequestMapping("/insertSubscription")
	public String inserData(@ModelAttribute Subscription subscription) {
		if (subscription != null)
			subscriptionService.insertData(subscription);
		return "redirect:/getListSubscription";
	}	
	
	@RequestMapping("/insertOferta")
	public String inserData(@ModelAttribute Oferta oferta) {
		if (oferta != null)
			ofertaService.insertData(oferta);
		return "redirect:/getListOffer";
	}
	
	@RequestMapping("/getList")
	public ModelAndView getUserLIst() {
		List<User> userList = userService.getUserList();
		return new ModelAndView("/administrador/userList", "userList", userList);
	}
	
	@RequestMapping("/getListSubscription")
	public ModelAndView getSubscriptionLIst() {
		List<Subscription> subscriptionList = subscriptionService.getSubscriptionList();
		return new ModelAndView("/suscripcion/subscriptionList", "subscriptionList", subscriptionList);
	}
	
	

	
	@RequestMapping("/getListOffer")
	public ModelAndView getOfertaList() {
		List<Oferta> ofertaList = ofertaService.getOfertaList();
		return new ModelAndView("/oferta/ofertaList", "listaOfertas", ofertaList);
	}

	
	//Modificado por Jose
	
	
	
	@RequestMapping(value="/filtroOfertas", method = RequestMethod.GET)
	public ModelAndView filtroOfertas(@ModelAttribute CriterioBusqueda criterioBusqueda) {
		List<Oferta> listaOfertas = new ArrayList<Oferta>();
		List<String> tipoList = new ArrayList<String>();
		tipoList.add("Todas");
		tipoList.add("Entradas");
		tipoList.add("Restaurantes");
		tipoList.add("Actividades");
		
		Map<String, List> map = new HashMap<String, List>();
		map.put("tipoList", tipoList);
		map.put("listaOfertas", listaOfertas);
		return new ModelAndView("/oferta/filtroOfertas", "map", map);	
		
	}
	
	
	/**
	 * Permitimos que nos asocie parametros de jsp a parametros del método
	 * para utilizar criterioBusqueda como un objeto
	 */
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.initDirectFieldAccess();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yy");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
     
    }

	
	
	
	
	
	
	@RequestMapping(value="/filtroOfertas", method = RequestMethod.POST)
	public String mostrarOfertas(ModelMap model, @Valid CriterioBusqueda criterioBusqueda, BindingResult result, HttpServletRequest request) {
		if(result.hasErrors()) {
			//Salimos si hay un error en la validación
			return "/oferta/filtroOfertas";
        }		
		//Creamos un listado con todas las ofertas que cumplen el criterio 
		List<Oferta> listaOfertas = new ArrayList<Oferta>();
		listaOfertas=this.ofertaService.filterOferta(criterioBusqueda);
		
		// Lo añadimos al modelo		
		model.addAttribute("listaOfertas",listaOfertas);
		model.addAttribute("numeroOfertas", listaOfertas.size());
		
		//añadimos criterio de busqueda a la sesion para utilizarlo en la reserva
		request.getSession().setAttribute("criterioBusquedaCliente", criterioBusqueda);
		
		//return "/oferta/filtroOfertas";
		return "/oferta/ofertaList";
	}
	
	
	@RequestMapping("/errorUser")
	public ModelAndView errorUser() {
		
		return new ModelAndView("/usuario/errorUser");
	}
	
	
	@RequestMapping("/getListOfertaProducto")
	public ModelAndView getFilterOferta(@RequestParam("tipo") String id) {
	    CriterioBusqueda criterioBusqueda = new CriterioBusqueda();
	    criterioBusqueda.setTipo(id);
	
	    
		List<Oferta> ofertaList = ofertaService.filterOferta(criterioBusqueda);
		return new ModelAndView("/oferta/ofertaList", "ofertaList", ofertaList);
	}
	
	
	@RequestMapping("/edit")
	public ModelAndView editUser(@RequestParam String id,
			@ModelAttribute User user) {

		user = userService.getUser(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);

		return new ModelAndView("/administrador/editUser", "map", map);
	}
	
	@RequestMapping("/editSubscription")
	public ModelAndView editSubscription(@RequestParam String id,
			@ModelAttribute Subscription subscription) {

		subscription = subscriptionService.getSubscription(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subscription", subscription);

		return new ModelAndView("/suscripcion/editSubscription", "map", map);
	}
	
	@RequestMapping("/editOferta")
	public ModelAndView editOferta(@RequestParam String id,
			@ModelAttribute Oferta oferta) {

		oferta = ofertaService.getOferta(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("oferta", oferta);

		return new ModelAndView("/oferta/editOferta", "map", map);
	}
	
	//modificado por Jose
	
	
	/**
	 * @param reservation
	 * @return
	 * Procesamos el get de la reserva basicamente vamos a mostrar un formulario con los valores recuperados de criterio de busqueda
	 */
	@RequestMapping(value="/reservaOferta", method = RequestMethod.GET)
	public String muestraReservaOferta(ModelMap model,  HttpServletRequest request, @RequestParam String id) {
		
		Reservation reserva = new Reservation();
		Calendar cal = Calendar.getInstance();
		CriterioBusqueda criterioBusquedaCliente = new CriterioBusqueda();
		Date fecha=new Date();
		String mensaje ="Recuerde que el número máximo de reservas por evento es 6";
		//recuperamos los datos de la oferta
		Oferta oferta=ofertaService.getOferta(id);
		//Y lo guardamos en la reserva
		reserva.setOfferId(Integer.parseInt(id));
		
		//Recuperamos el usuario
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String nombre = auth.getName(); //obtenemos el usuario
	    User usuario = userService.getUserPorNombre(nombre);
	    
	    //guardamos en la reserva
	    reserva.setUserId(usuario.getUserId());
		
		//recuperamos el criterio de busqueda del cliente(en el caso de que exista)
		criterioBusquedaCliente=(CriterioBusqueda) request.getSession().getAttribute("criterioBusquedaCliente");
		//Utilidad para formatear la fecha del criterio de busqueda
		SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy", new Locale("es_ES"));				
		//Comprobamos que existe la busqueda por si venía de otro sitio
		if(criterioBusquedaCliente!=null && criterioBusquedaCliente.getFecha()!=null){
			//guardamos la fecha en la reserva con el formato correcto
			fecha=criterioBusquedaCliente.getFecha();
			reserva.setFechaReserva( formateador.format(fecha));
			//guardamos el número de plazas
			reserva.setPlazasReservadas(criterioBusquedaCliente.getPlazas());
			
		}
		//si no hubo busqueda sugerimos el día actual y número de reservas 1
		else{
			
			reserva.setFechaReserva(formateador.format(cal.getTime()));
			reserva.setPlazasReservadas(1);
		}
		criterioBusquedaCliente=null;
		model.addAttribute("reservation", reserva);
		//y lo guardamos en la sesión
		request.getSession().setAttribute("reserva", reserva);
		model.addAttribute("titulo", oferta.getTitulo());
		model.addAttribute("mensaje",mensaje);
		
		return "/reserva/reservaOferta";
	}
	
	@RequestMapping(value="/reservasListCliente", method = RequestMethod.GET)
	public String muestraReservasCliente(Model model){
		int numeroReservas=0;
		Reservation reserva;
		Oferta oferta;
		List<Reservation> listaReservas = null;
		List<Oferta> listaOfertas=null;
		Map<Reservation,Oferta> map = new HashMap<Reservation,Oferta>();
		//Recuperamos el usuario
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String nombre = auth.getName(); //obtenemos el usuario
	    User usuario = userService.getUserPorNombre(nombre);
	    
	    listaReservas=reservationService.getReservationListPorCliente(usuario.getUserId());
	    for (Iterator iter = listaReservas.iterator(); iter.hasNext(); ) {
	        // código aquí
	    	reserva=(Reservation) iter.next();
	    	oferta=ofertaService.getOferta(Integer.toString(reserva.getOfferId()));
	    	map.put(reserva, oferta);
	    }
		numeroReservas= listaReservas.size();
		
		model.addAttribute("listaResultados", map);
		
		
		
		return "/reserva/reservasListCliente";
	}
	
	
	
	
	
	
	
	
	//modificado por Jose
	@RequestMapping(value="/reserva/reservaOferta", method = RequestMethod.POST)
	public String reservaOferta(Model model, @Valid Reservation reservation, HttpServletRequest request, BindingResult result) {
		Reservation reserva=(Reservation) request.getSession().getAttribute("reserva");
		Oferta oferta = null;
		String mensaje ="";
		//if(result.hasErrors()) {
			//Salimos si hay un error en la validación
			
			//return "reservaOferta?id="+reserva.getOfferId();
        //}
		if(reservation.getPlazasReservadas()>6){
			String cadena = "/reserva/reservaOferta?id="+reserva.getOfferId();
			mensaje="número máximo es 6";
			return cadena;
		}
		oferta=ofertaService.getOferta(String.valueOf(reserva.getOfferId()));
		reserva.setFechaReserva(reservation.getFechaReserva());
		reserva.setPlazasReservadas(reservation.getPlazasReservadas());
		oferta.setPlazasDisponibles(oferta.getPlazasDisponibles()-reserva.getPlazasReservadas());
		ofertaService.decreasePlazasDisponibles(reserva.getOfferId(), reserva.getPlazasReservadas());
		reservationService.insertData(reservation);
		request.getSession().removeAttribute("reserva");
		request.getSession().removeAttribute("criterioBusquedaCliente");
		model.addAttribute(mensaje);
		return "/reserva/ofertaCompletada";
	}
	//editado por Jose
	
	@RequestMapping("/deletereserva")
	public String deleteReserva(@RequestParam String id) {
		Reservation reserva=reservationService.getReservation(id);
		Oferta oferta = oferta=ofertaService.getOferta(String.valueOf(reserva.getOfferId()));
		
		ofertaService.increasePlazasDisponibles(reserva.getOfferId(), reserva.getPlazasReservadas());
		reservationService.deleteData(String.valueOf(reserva.getReservationId()));
		
		return "/reserva/reservaBorrada";
	}
	
	@RequestMapping("/update")
	public String updateUser(@ModelAttribute User user) {
		userService.updateData(user);
		return "redirect:/getList";
	}
	
	@RequestMapping("/updateSubscription")
	public String updateSubscription(@ModelAttribute Subscription subscription) {
		subscriptionService.updateData(subscription);
		return "redirect:/getListSubscription";
	}
	
	@RequestMapping("/updateOferta")
	public String updateOferta(@ModelAttribute Oferta oferta) {
		ofertaService.updateData(oferta);
		return "redirect:/getListOffer";
	}

	@RequestMapping("/delete")
	public String deleteUser(@RequestParam String id) {
		System.out.println("id = " + id);
		userService.deleteData(id);
		return "redirect:/getList";
	}
	
	@RequestMapping("/deleteSubscription")
	public String deleteSubscription(@RequestParam String id) {
		System.out.println("id = " + id);
		subscriptionService.deleteData(id);
		return "redirect:/getListSubscription";
	}
	
	@RequestMapping("/deleteOferta")
	public String deleteOferta(@RequestParam String id) {
		System.out.println("id = " + id);
		ofertaService.deleteData(id);
		return "redirect:/getListOffer";
	}
	
	

	
	//TO-DO: Andrés.. Método muy cutre para la página de contacto... por si queremos montar algo dinámicamente cogiendo algun dato de BBDD.
	//Pendiente mejorar 
	@RequestMapping("/contact")
	//public String loginUser(@RequestParam String username, @RequestParam String password) {
	public ModelAndView contactoWeb() {
		//System.out.println("login = " + username + ",password=" + password);
		return new ModelAndView("/web/contact");
	}

   
	@RequestMapping("/cuenta")
	public String datoscuenta(Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		    String currentUserName = authentication.getName();
		    
		    
		    model.addAttribute("username", currentUserName);
			return "/usuario/micuenta";

	}	
	
}