package com.practica.si3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdministradorController {

	@RequestMapping("/admingestprov")
	public String gestionarProveedores() {
		return "/administrador/adminprov";
	}
	
	@RequestMapping("/admingestuser")
	public String gestionarUsuarios() {
		return "/administrador/adminuser";
	}

	@RequestMapping("/admingestoferta")
	public String gestionarOfertas() {
		return "/administrador/adminoferta";
	}
	
	@RequestMapping("/admingestsuscripcion")
	public String gestionarSuscripciones() {
		return "/administrador/adminsuscripcion";
	
	}
	
	
}


