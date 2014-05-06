package com.practica.si3.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login")
public class LoginController {

	//TO-DO: Andrés.. Método muy cutre para el login.. lo único que hace es devolver la vista de login
	//Pendiente mejorar para añadir campos de usuario, validación, etc. 
	/*	@RequestMapping("/login")
	//public String loginUser(@RequestParam String username, @RequestParam String password) {
	public ModelAndView loginUser() {
		//System.out.println("login = " + username + ",password=" + password);
		return new ModelAndView("/usuario/login");
	}

	*/
	@RequestMapping(method=RequestMethod.GET)
	public String login() {
		return "/usuario/login";
	}

	@RequestMapping(value = "/error", method = RequestMethod.GET)
    public String loginWithError(Locale locale, Model model) {
        model.addAttribute("error", true);
        return "loginerror";
    }
}
