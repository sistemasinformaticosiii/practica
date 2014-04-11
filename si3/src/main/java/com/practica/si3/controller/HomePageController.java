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
import com.practica.si3.services.UserService;

@Controller
public class HomePageController {

	@Autowired
	UserService userService;

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
	
	@RequestMapping("/insert")
	public String inserData(@ModelAttribute User user) {
		if (user != null)
			userService.insertData(user);
		return "redirect:/getList";
	}
	
	@RequestMapping("/getList")
	public ModelAndView getUserLIst() {
		List<User> userList = userService.getUserList();
		return new ModelAndView("userList", "userList", userList);
	}
	
	@RequestMapping("/edit")
	public ModelAndView editUser(@RequestParam String id,
			@ModelAttribute User user) {

		user = userService.getUser(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);

		return new ModelAndView("edit", "map", map);
	}
	
	@RequestMapping("/update")
	public String updateUser(@ModelAttribute User user) {
		userService.updateData(user);
		return "redirect:/getList";
	}

	@RequestMapping("/delete")
	public String deleteUser(@RequestParam String id) {
		System.out.println("id = " + id);
		userService.deleteData(id);
		return "redirect:/getList";
	}

}