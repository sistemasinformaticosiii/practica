package com.practica.si3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class LoginController {
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "/public/login";
	}

	@RequestMapping(value = "/public/errorlogin", method = RequestMethod.GET)
    public String loginWithError(Model model) {
        model.addAttribute("error", true);
        return "/public/loginerror";
    }
	
	@RequestMapping(value = "/public/logout", method = RequestMethod.GET)
	public String logout() {
		return "/public/logout";
	}
	

}
