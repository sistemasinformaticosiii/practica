package com.practica.si3.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

		Map<String, List> map = new HashMap<String, List>();
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
		} else
			return "redirect:/errorUser";
	}

	@RequestMapping("/insertSubscription")
	public String inserData(@RequestParam("tipoSubscription") String tipo,
			@ModelAttribute Subscription subscription) {
		if (subscription != null){
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String currentUserName = authentication.getName();
			User currentUser = userService.getUserByName(currentUserName);
			subscriptionService.deleteDataByUser(currentUser.getUserId(), tipo);	
			subscriptionService.insertData(subscription);
		}
		return "redirect:/getListSubscription";
	}

	@RequestMapping("/insertOferta")
	public String inserData(@ModelAttribute Oferta oferta) {

		Authentication authentication = SecurityContextHolder.getContext()
				.getAuthentication();
		String currentUserName = authentication.getName();
		User currentUser = userService.getUserByName(currentUserName);
		oferta.setCodUsuario(currentUser.getUserId());
		oferta.setTipo(currentUser.getPerfil());
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
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();
		User currentUser = userService.getUserByName(currentUserName);
		List<Subscription> subscriptionList = subscriptionService.getSubscriptionListId(currentUser.getUserId());
		return new ModelAndView("/suscripcion/subscriptionList", "subscriptionList", subscriptionList);
	}

	@RequestMapping("/getListOffer")
	public ModelAndView getOfertaList() {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();
		List<Oferta> ofertaList = new ArrayList();
		User currentUser = userService.getUserByName(currentUserName);

		ofertaList = ofertaService.getOfertaByPerfil(currentUser.getUserId());
		return new ModelAndView("/proveedor/ofertaListProveedor",
				"listaOfertas", ofertaList);
	}

	//Listado de oferta vigentes iniciales, mostrado al arrancar la aplicación
	@RequestMapping("/getListOfferInicio")
	public ModelAndView getOfertaListInicio() {

		List<Oferta> ofertaListInicio = ofertaService.getOfertaList();
		return new ModelAndView("/oferta/ofertaList","listaOfertas", ofertaListInicio);
	}

	@RequestMapping(value = "/filtroOfertas", method = RequestMethod.GET)
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

	@RequestMapping(value = "/filtroOfertas", method = RequestMethod.POST)
	public String mostrarOfertas(ModelMap model,
			@Valid CriterioBusqueda criterioBusqueda, BindingResult result) {
		if (result.hasErrors()) {
			// Salimos si hay un error en la validación
			return "/oferta/filtroOfertas";
		}
		// Creamos un listado con todas las ofertas que cumplen el criterio
		List<Oferta> listaOfertas = new ArrayList<Oferta>();
		listaOfertas = this.ofertaService.filterOferta(criterioBusqueda);

		// Lo añadimos al modelo
		model.addAttribute("listaOfertas", listaOfertas);
		model.addAttribute("numeroOfertas", listaOfertas.size());

		// return "/oferta/filtroOfertas";
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

	@RequestMapping("/contact")
	public ModelAndView contactoWeb() {
		return new ModelAndView("/public/contact");
	}

	@RequestMapping("/cuenta")
	public String datoscuenta(Model model) {

		Authentication authentication = SecurityContextHolder.getContext()
				.getAuthentication();
		String currentUserName = authentication.getName();

		model.addAttribute("username", currentUserName);
		return "/usuario/micuenta";
	}

}