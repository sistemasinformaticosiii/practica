package com.practica.si3.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
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
		return new ModelAndView("/oferta/registerOferta", "map", map);
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
	 * Permitimos que nos asocie parametros de jsp a parametros del m�todo
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
	public String mostrarOfertas(ModelMap model, @Valid CriterioBusqueda criterioBusqueda, BindingResult result) {
		if(result.hasErrors()) {
			//Salimos si hay un error en la validaci�n
			return "/oferta/filtroOfertas";
        }		
		//Creamos un listado con todas las ofertas que cumplen el criterio 
		List<Oferta> listaOfertas = new ArrayList<Oferta>();
		listaOfertas=this.ofertaService.filterOferta(criterioBusqueda);
		
		// Lo a�adimos al modelo		
		model.addAttribute("listaOfertas",listaOfertas);
		model.addAttribute("numeroOfertas", listaOfertas.size());
		
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
	
	@RequestMapping("/reservaOferta")
	public ModelAndView reservaOferta(@ModelAttribute Reservation reservation) {
		
		return new ModelAndView("/reserva/reservaOferta");
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
	
	
	//TO-DO: Andr�s.. M�todo muy cutre para el login.. lo �nico que hace es devolver la vista de login
	//Pendiente mejorar para a�adir campos de usuario, validaci�n, etc. 
/*	@RequestMapping("/login")
	//public String loginUser(@RequestParam String username, @RequestParam String password) {
	public ModelAndView loginUser() {
		//System.out.println("login = " + username + ",password=" + password);
		return new ModelAndView("/usuario/login");
	}
   
*/
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "/usuario/login";
	}
   

	
	//TO-DO: Andr�s.. M�todo muy cutre para la p�gina de contacto... por si queremos montar algo din�micamente cogiendo algun dato de BBDD.
	//Pendiente mejorar 
	@RequestMapping("/contact")
	//public String loginUser(@RequestParam String username, @RequestParam String password) {
	public ModelAndView contactoWeb() {
		//System.out.println("login = " + username + ",password=" + password);
		return new ModelAndView("/web/contact");
	}

   
	
	
}