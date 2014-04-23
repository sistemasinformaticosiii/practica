package com.practica.si3.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.practica.si3.domain.User;
import com.practica.si3.services.ReservationService;
import com.practica.si3.domain.Reservation;
import com.practica.si3.services.UserService;
import com.practica.si3.domain.Oferta;
import com.practica.si3.services.OfertaService;
import com.practica.si3.domain.Subscription;
import com.practica.si3.services.SubscriptionService;

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
		perfilList.add("admin");
		perfilList.add("cliente");
		perfilList.add("proveedor");

		Map<String, List> map = new HashMap<String, List>();
		map.put("tipoList", tipoList);
		map.put("perfilList", perfilList);
		return new ModelAndView("register", "map", map);
	}
	
	@RequestMapping("/registerSubscription")
	public ModelAndView registerUser(@ModelAttribute Subscription subscription) {

		List<String> tipoList = new ArrayList<String>();
		tipoList.add("Entradas");
		tipoList.add("Restaurantes");
		tipoList.add("Actividades");

		Map<String, List> map = new HashMap<String, List>();
		map.put("tipoList", tipoList);
		return new ModelAndView("registerSubscription", "map", map);
	}
	
	@RequestMapping("/registerOferta")
	public ModelAndView registerOferta(@ModelAttribute Oferta oferta) {

		List<String> tipoList = new ArrayList<String>();
		tipoList.add("Entradas");
		tipoList.add("Restaurantes");
		tipoList.add("Actividades");

		Map<String, List> map = new HashMap<String, List>();
		map.put("tipoList", tipoList);
		return new ModelAndView("registerOferta", "map", map);
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
		return new ModelAndView("userList", "userList", userList);
	}
	
	@RequestMapping("/getListSubscription")
	public ModelAndView getSubscriptionLIst() {
		List<Subscription> subscriptionList = subscriptionService.getSubscriptionList();
		return new ModelAndView("subscriptionList", "subscriptionList", subscriptionList);
	}
	
	@RequestMapping("/getListOffer")
	public ModelAndView getOfertaList() {
		List<Oferta> ofertaList = ofertaService.getOfertaList();
		return new ModelAndView("ofertaList", "ofertaList", ofertaList);
	}
	
	@RequestMapping("/filtroOfertas")
	public ModelAndView filtroOfertas(@ModelAttribute Oferta oferta) {
		
		List<String> tipoList = new ArrayList<String>();
		tipoList.add("Entradas");
		tipoList.add("Restaurantes");
		tipoList.add("Actividades");
		

		Map<String, List> map = new HashMap<String, List>();
		map.put("tipoList", tipoList);
		return new ModelAndView("filtroOfertas", "map", map);
	}
	
	@RequestMapping("/errorUser")
	public ModelAndView errorUser() {
		
		return new ModelAndView("errorUser");
	}
	
	@RequestMapping("/getListOfertaProducto")
	public ModelAndView getFilterOferta(@RequestParam("tipo") String id) {
	
		List<Oferta> ofertaList = ofertaService.filterOferta(id, "", "2014-04-17", 0, 0);
		return new ModelAndView("ofertaList", "ofertaList", ofertaList);
	}
	
	@RequestMapping("/edit")
	public ModelAndView editUser(@RequestParam String id,
			@ModelAttribute User user) {

		user = userService.getUser(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);

		return new ModelAndView("edit", "map", map);
	}
	
	@RequestMapping("/editSubscription")
	public ModelAndView editSubscription(@RequestParam String id,
			@ModelAttribute Subscription subscription) {

		subscription = subscriptionService.getSubscription(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subscription", subscription);

		return new ModelAndView("editSubscription", "map", map);
	}
	
	@RequestMapping("/editOferta")
	public ModelAndView editOferta(@RequestParam String id,
			@ModelAttribute Oferta oferta) {

		oferta = ofertaService.getOferta(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("oferta", oferta);

		return new ModelAndView("editOferta", "map", map);
	}
	
	@RequestMapping("/reservaOferta")
	public ModelAndView reservaOferta(@ModelAttribute Reservation reservation) {
		
		return new ModelAndView("reservaOferta");
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

}