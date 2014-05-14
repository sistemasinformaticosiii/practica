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

import org.springframework.security.core.GrantedAuthority;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
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
	@Autowired
	SendEmailController mailInicio;

	/**
	 * @param 
	 * @return
	 * Registro de nuevos usuarios. Tanto para usuarios anónimos para registrarse en la aplicación, como para que el administrador registre uno nuevo.
	 */
	@RequestMapping("/public/register")
	public String registerUser(@ModelAttribute User user, ModelMap model, @RequestParam("type") String tiporegistro) {
		model.addAttribute("tiporegistro", tiporegistro);
		return "/administrador/register";
	}
	
	/**
	 * @param 
	 * @return
	 * Registro de suscripción e-mail para usuarios registrados (Clientes).
	 */
	@RequestMapping("/cliente/registerSubscription")
	public ModelAndView registerSubscription(@ModelAttribute Subscription subscription) {
		return new ModelAndView("/suscripcion/registerSubscription");
	}
	
	/**
	 * @param 
	 * @return
	 * Registro de suscripción e-mail para ser utilizado por el Administrador.
	 */
	@RequestMapping("/admin/registerSubscriptionAdmin")
	public ModelAndView registerSubscriptionAdmin(@RequestParam(value="roles", required=false) List<String> roles, 
			@ModelAttribute Subscription subscription) {
		/*List<String> role = new ArrayList<String>();
		role.add("Cliente");*/
		List<User> userList = userService.getUserList(roles);
		return new ModelAndView("/administrador/registerSubscriptionAdmin", "userList", userList);
	}
		
	/**
	 * @param 
	 * @return
	 * Registro de Oferta (Publicación): Para el rol Proveedor
	 */
	/*TO-DO: Este método ya no necesita el parámetro tiporegistrador? Si se ha duplicado el método para el Admin, ya no es necesario. A revisar.*/
	@RequestMapping("/proveedor/registerOferta")
	public String registerOferta(@ModelAttribute Oferta oferta, Model model, @RequestParam("type") String tiporegistrador) {
		model.addAttribute("tiporegistrador", tiporegistrador);
		return "/proveedor/registerOferta";
	}
	
	/**
	 * @param
	 * @return
	 * Registro de Oferta (Publicacion): Para el rol Administrador
	 */
	@RequestMapping("/admin/registerOfertaAdmin")
	public ModelAndView registerOfertaAdmin(@RequestParam(value="roles", required=false) List<String> roles, 
			@ModelAttribute Oferta oferta) {
		
		List<User> userList = userService.getUserList(roles);
		return new ModelAndView("/administrador/registerOfertaAdmin", "userList", userList);
	}

	/**
	 * @param 
	 * @return
	 * Añade un nuevo usuario 
	 */
	@RequestMapping("/registered/insert")
	public String inserData(@ModelAttribute User user) {
		if (!userService.existUser(user.getEmail()) && (user != null)) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			
			if(!(authentication instanceof AnonymousAuthenticationToken)){
				//Usuario que está logueado (es decir, en este caso: Administrador que registra a un nuevo usuario)	
				userService.insertData(user);
				return "redirect:/admin/getUserList";
			}		
			else{ //Usuario anónimo, que acaba de completar el registro.
				userService.insertData(user);
				return "redirect:/login";
			}	
		} else
			return "redirect:/public/errorUser";
	}

	/**
	 * @param 
	 * @return
	 * Añadir nueva suscripción
	 */
	@RequestMapping("/cliente/insertSubscription")
	public String inserDataSubscription(@RequestParam("tipoSubscription") String tipo,@ModelAttribute Subscription subscription) {
		if (subscription != null){
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String currentUserName = authentication.getName();
			User currentUser = userService.getUserByName(currentUserName);
			subscriptionService.deleteDataByUser(currentUser.getUserId(), tipo);	
			subscriptionService.insertData(subscription);
		}
		return "redirect:/cliente/getListSubscription";
	}
	
	/**
	 * @param 
	 * @return
	 * Añaadir nueva suscripción (para el Administrador) 
	 */
	@RequestMapping("/admin/insertSubscriptionAdmin")
	public String inserDataSubscriptionAdmin(@RequestParam("tipoSubscription") String tipo, @RequestParam("userId") int id,
		@ModelAttribute Subscription subscription) {
		if (subscription != null){
			subscriptionService.deleteDataByUser(id, tipo);	
			subscriptionService.insertData(subscription);
		}
		return "redirect:/admin/getListSubscriptionAdmin";
	}

	
	/**
	 * @param 
	 * @return
	 */
	@RequestMapping("/proveedor/insertOferta")
	public String inserDataOferta(@ModelAttribute Oferta oferta) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();
		User currentUser = userService.getUserByName(currentUserName);
		oferta.setCodUsuario(currentUser.getUserId());
		oferta.setTipo(currentUser.getPerfil());
		if (oferta != null)
			ofertaService.insertData(oferta);
		return "redirect:/proveedor/getListOffer";
	}
	
	/**
	 * @param
	 * @return
	 * Insercion de una oferta desde el rol Administrador
	 */
	@RequestMapping("/admin/insertOfertaAdmin")
	public String inserDataOfertaAdmin(@RequestParam int codUsuario, @ModelAttribute Oferta oferta) {

		User userSelect = userService.getUser(Integer.toString(codUsuario));
		oferta.setTipo(userSelect.getPerfil());
		if (oferta != null)
			ofertaService.insertData(oferta);
		return "redirect:/admin/getListOfferAdmin";
	}
	
	
	/**
	 * @param  
	 * @return 
	 * Obtenció del listado de usuarios. Si recibe parámetro roles, obtiene los usuarios de esos roles. 
	 * Si recibe parámetro vacío, obtiene todos los usuarios. 
	 */
	@RequestMapping("/admin/getUserList")
	public ModelAndView getUserLIst(@RequestParam(value="roles", required=false) List<String> roles) {
		List<User> userList = userService.getUserList(roles);
		return new ModelAndView("/administrador/userList", "userList", userList);
	}
	
	/**
	 * @param  
	 * @return 
	 * Obtención del listado de suscripciones de un usuario registrado 
	 */
	@RequestMapping("/cliente/getListSubscription")
	public ModelAndView getSubscriptionList() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();
		User currentUser = userService.getUserByName(currentUserName);
		List<Subscription> subscriptionList = subscriptionService.getSubscriptionListId(currentUser.getUserId());
 		return new ModelAndView("/suscripcion/subscriptionList", "subscriptionList", subscriptionList);
	}
	
	/**
	 * @param  
	 * @return 
	 * Obtención del listado de suscripciones de todos los usuarios. 
	 */
	@RequestMapping("/admin/getListSubscriptionAdmin")
	public ModelAndView getSubscriptionListAdmin() {
		List<Subscription> subscriptionList = subscriptionService.getSubscriptionList();
		return new ModelAndView("/administrador/subscriptionList", "subscriptionList", subscriptionList);
	}
	
	/**
	 * @param  
	 * @return 
	 * Obtención del listado de ofertas publicadas por un proveedor 
	 */
	@RequestMapping("/proveedor/getListOffer")
	public ModelAndView getOfertaList() {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();
		List<Oferta> ofertaList = new ArrayList();
		User currentUser = userService.getUserByName(currentUserName);

		ofertaList = ofertaService.getOfertaByPerfil(currentUser.getUserId());
		return new ModelAndView("/proveedor/ofertaListProveedor",
				"listaOfertas", ofertaList);
	}

	/**
	 * @param 
	 * @return 
	 * Listado de todas las oferta vigentes iniciales, mostrado al arrancar la aplicación 
	 */
	@RequestMapping("/public/getListOfferInicio") 
	public ModelAndView getOfertaListInicio()  throws Exception {
		mailInicio.doSendEmail();
		List<Oferta> ofertaListInicio = ofertaService.getOfertaList();
		return new ModelAndView("/oferta/ofertaList","listaOfertas", ofertaListInicio);
	}
	
	/**
	 * @param
	 * @return
	 * Listado de todas las ofertas vigentes o no para el perfil Administrador
	 */
	@RequestMapping("/admin/getListOfferAdmin") 
	public ModelAndView getOfertaListAdmin(){
		
		List<Oferta> ofertaListInicio = ofertaService.getOfertaListAll();
		return new ModelAndView("/administrador/ofertaList","listaOfertas", ofertaListInicio);
	}
	
	/**
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/public/filtroOfertas", method = RequestMethod.GET)
	public ModelAndView filtroOfertas(
			@ModelAttribute CriterioBusqueda criterioBusqueda) {
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
	 * Permitimos que nos asocie parametros de jsp a parametros del método para
	 * utilizar criterioBusqueda como un objeto
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.initDirectFieldAccess();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yy");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));

	}

	/**
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/public/filtroOfertas", method = RequestMethod.POST)
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
	
	/**
	 * @param 
	 * @return
	 */
	@RequestMapping("/public/errorUser")
	public ModelAndView errorUser() {

		return new ModelAndView("/usuario/errorUser");
	}


	/*TO-DO: Sin uso???? */
//	/**
//	 * @param 
//	 * @return
//	 */
//	@RequestMapping("/getListOfertaProducto")
//	public ModelAndView getFilterOferta(@RequestParam("tipo") String id) {
//		CriterioBusqueda criterioBusqueda = new CriterioBusqueda();
//		criterioBusqueda.setTipo(id);
//
//		List<Oferta> ofertaList = ofertaService.filterOferta(criterioBusqueda);
//		return new ModelAndView("/oferta/ofertaList", "ofertaList", ofertaList);
//	}

	/**
	 * @param 
	 * @return
	 * Editar datos de un usuario
	 */
	@RequestMapping("/admin/editUser")
	public ModelAndView editUser(@ModelAttribute User user, @RequestParam String id) {
		user = userService.getUser(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		map.put("perfilAEditar", user.getPerfil());
		return new ModelAndView("/administrador/editUser", "map", map);
	}
	
//TO-DO: Sin uso??????
	//Revisado: No se usa ya, porque se usa el mismo método de edición de usuarios: editUser
//	/**
//	 * @param 
//	 * @return
//	 * Editar datos de un proveedor
//	 */
//	@RequestMapping("/admin/editProveedor")
//	public ModelAndView editProveedor(@RequestParam String id, @ModelAttribute User user ) {
//		user = userService.getUser(id);
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("user", user);
//		return new ModelAndView("/administrador/editProveedor", "map", map);
//	}

//TO-DO: Sin uso??????	
//	/**
//	 * @param 
//	 * @return
//	 */
//	@RequestMapping("/editSubscription")
//	public ModelAndView editSubscription(@RequestParam String id,
//			@ModelAttribute Subscription subscription) {
//
//		subscription = subscriptionService.getSubscription(id);
//
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("subscription", subscription);
//
//		return new ModelAndView("/suscripcion/editSubscription", "map", map);
//	}
	
	/**
	 * @param 
	 * @return
	 * Edición de una oferta, sólo para el Administrador
	 */ 
	@RequestMapping("/admin/editOferta")
	public ModelAndView editOferta(@RequestParam String id,
			@ModelAttribute Oferta oferta) {

		oferta = ofertaService.getOferta(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("oferta", oferta);

		return new ModelAndView("/oferta/editOferta", "map", map);
	}

	/**
	 * @param
	 * @return
	 */
	@RequestMapping("/admin/editReserva")
	public ModelAndView editOferta(@RequestParam String id,@ModelAttribute Reservation reservation) {
		
		reservation= reservationService.getReservation(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reservation", reservation);
		
		return new ModelAndView("/reserva/editReserva", "map", map);
	}
	
	/**
	 * @param reservation
	 * @return
	 * Procesamos el get de la reserva basicamente vamos a mostrar un formulario con los valores recuperados de criterio de busqueda
	 */
	@RequestMapping(value="/cliente/reservaOferta", method = RequestMethod.GET)
	public String muestraReservaOferta(ModelMap model,  HttpServletRequest request, @RequestParam String id) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(!(authentication instanceof AnonymousAuthenticationToken)){
			//Usuario logueado
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
		    User usuario = userService.getUserByName(nombre);
		    
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
		else{ //Usuario anónimo, que acaba de completar el registro.
			return "redirect:/login";
		}	
		
	}
	
	
	/**
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/cliente/reservasListCliente", method = RequestMethod.GET)
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
	    User usuario = userService.getUserByName(nombre);
	    
	    listaReservas=reservationService.getReservationListPorCliente(usuario.getUserId());
	    for (Iterator iter = listaReservas.iterator(); iter.hasNext(); ) {
	        // código aquí
	    	reserva=(Reservation) iter.next();
	    	oferta=ofertaService.getOferta(Integer.toString(reserva.getOfferId()));
	    	map.put(reserva, oferta);
	    }
		numeroReservas= listaReservas.size();
		
		model.addAttribute("listaResultados", map);
		model.addAttribute("numeroreservas", numeroReservas);
		
		return "/reserva/reservasListCliente";
	}
	
	/**
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/admin/reservasListAdmin")
	public String muestraTodasReservas(Model model){
		
		int numeroReservas=0;
		Reservation reserva;
		Oferta oferta;
		List<Reservation> listaReservas = null;
		List<Oferta> listaOfertas=null;
		Map<Reservation,Oferta> map = new HashMap<Reservation,Oferta>();
    
	    listaReservas=reservationService.getReservationList();
	    for (Iterator iter = listaReservas.iterator(); iter.hasNext(); ) {
	    	reserva=(Reservation) iter.next();
	    	oferta=ofertaService.getOferta(Integer.toString(reserva.getOfferId()));
	    	map.put(reserva, oferta);
	    }
		numeroReservas= listaReservas.size();
		model.addAttribute("listaResultados", map);
		model.addAttribute("numeroreservas", numeroReservas);
		return "/administrador/reservasListAdmin";
	}	
	
	
	/**
	 * @param
	 * @return
	 */
	@RequestMapping(value="/cliente/reserva/reservaOferta", method = RequestMethod.POST)
	public String reservaOferta(@Valid Reservation reservation, HttpServletRequest request, BindingResult result) {
		Reservation reserva=(Reservation) request.getSession().getAttribute("reserva");
		Oferta oferta=ofertaService.getOferta(Integer.toString(reserva.getOfferId()));
		String vista="";
		if (reservation.getPlazasReservadas()>6){
			vista="/reserva/numeroExcesivo";
		}
		else{
			if (reservation.getPlazasReservadas()>oferta.getPlazasDisponibles()){
				vista="/reserva/noEntradasDisponibles";
			}
			else {
				reserva.setFechaReserva(reservation.getFechaReserva());
				reserva.setPlazasReservadas(reservation.getPlazasReservadas());
				reservationService.insertData(reserva);
				ofertaService.decreasePlazasDisponibles(reserva.getOfferId(), reserva.getPlazasReservadas());
				vista="/reserva/ofertaCompletada";
			}
		}
		request.getSession().removeAttribute("reserva");
		request.getSession().removeAttribute("criterioBusquedaCliente");
		return vista;
	}		


	/**
	 * @param 
	 * @return
	 */
	@RequestMapping("/cliente/deletereserva")
 	public String deleteReserva(@RequestParam String id) {
 		Reservation reserva=reservationService.getReservation(id);
 		Oferta oferta = oferta=ofertaService.getOferta(String.valueOf(reserva.getOfferId()));
 		ofertaService.increasePlazasDisponibles(reserva.getOfferId(), reserva.getPlazasReservadas());

 		reservationService.deleteData(String.valueOf(reserva.getReservationId()));
 		return "/reserva/reservaBorrada";
 	}
	
	/**
	 * @param 
	 * @return
	 */
	@RequestMapping("/admin/update")
	public String updateUser(@ModelAttribute User user) {
		userService.updateData(user);
		return "redirect:/admin/getUserList";
	}

// TO-DO: Sin uso????
//	/**
//	 * @param 
//	 * @return
//	 */
//	@RequestMapping("/updateSubscription")
//	public String updateSubscription(@ModelAttribute Subscription subscription) {
//		subscriptionService.updateData(subscription);
//		return "redirect:/getListSubscription";
//	}

	/**
	 * @param 
	 * @return
	 */
	@RequestMapping("/proveedor/updateOferta")
	public String updateOferta(@ModelAttribute Oferta oferta) {
		ofertaService.updateData(oferta);
		return "redirect:/proveedor/getListOffer";
	}
	
	/**
	 * @param
	 * @return
	 * Actualiza valores de una oferta desde el perfil Administrador. Redirige a listado de ofertas.
	 */
	@RequestMapping("/admin/updateOfertaAdmin")
	public String updateOfertaAdmin(@ModelAttribute Oferta oferta) {
		ofertaService.updateData(oferta);
		return "redirect:/admin/getListOfferAdmin";
	}
	
	/**
	 * @param 
	 * @return
	 */
	@RequestMapping("/updateReserva")
	public String updateReserva(@ModelAttribute Reservation reservation) {
		reservationService.updateData(reservation);
		return "redirect:/cliente/reservasListCliente";
	}	
	

	/**
	 * @param 
	 * @return
	 */
	@RequestMapping("/admin/delete")
	public String deleteUser(@RequestParam String id, HttpServletRequest request) {
		
		userService.deleteData(id);
		subscriptionService.deleteDataByCodigo(Integer.parseInt(id));
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}
	
	/**
	 * @param 
	 * @return
	 * Borrado de la suscripción de un usuario
	 */ 
	@RequestMapping("/cliente/deleteSubscription")
	public String deleteSubscription(@RequestParam String id) {
		System.out.println("id = " + id);
		subscriptionService.deleteData(id);
		return "redirect:/cliente/getListSubscription";
	}

	/**
	 * @param 
	 * @return
	 * Borrado de suscripciones por parte del Administrador (de cualquier usuario con suscripciones)
	 */
	@RequestMapping("/admin/deleteSubscriptionAdmin")
	public String deleteSubscriptionAdmin(@RequestParam String id) {
		System.out.println("id = " + id);
		subscriptionService.deleteData(id);
		return "redirect:/admin/getListSubscriptionAdmin";
	}

	/**
	 * @param 
	 * @return
	 * Borrado de ofertas por parte del Administrador (de cualquier oferta)
	 */	
	@RequestMapping("/admin/deleteOferta")
	public String deleteOferta(@RequestParam String id) {
		
		ofertaService.deleteData(id);
		return "redirect:/admin/getListOfferAdmin";
	}
	
	/**
	 * @param 
	 * @return
	 * Datos de contacto de la aplicación
	 */	
	@RequestMapping("/public/contact")
	public ModelAndView contactoWeb() {
		return new ModelAndView("/public/contact");
	}

	/**
	 * @param 
	 * @return
	 * Datos de la cuenta de usuario (cualquier rol)
	 */	
	@RequestMapping("/registered/cuenta")
	public String datoscuenta(Model model) {

		Authentication authentication = SecurityContextHolder.getContext()
				.getAuthentication();
		String currentUserName = authentication.getName();

		model.addAttribute("username", currentUserName);
		return "/usuario/micuenta";
	}

}