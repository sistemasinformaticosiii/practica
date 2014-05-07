package com.practica.si3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login")
public class LoginController {

	@RequestMapping(method=RequestMethod.GET)
	public String login() {
		return "/usuario/login";
	}

	@RequestMapping(value = "/error", method = RequestMethod.GET)
    public String loginWithError(Model model) {
        model.addAttribute("error", true);
        return "/usuario/loginerror";
    }
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		return "/usuario/logout";
	}
	

}
