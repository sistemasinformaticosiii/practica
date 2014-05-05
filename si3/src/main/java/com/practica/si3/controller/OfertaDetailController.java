package com.practica.si3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.practica.si3.domain.Oferta;
import com.practica.si3.services.OfertaService;

@Controller
public class OfertaDetailController {

	@Autowired
	OfertaService ofertaService;
	
	 @RequestMapping(value = "/detailOferta/{ofertaId}")
	    public String details(@PathVariable("ofertaId") String ofertaId, Model model) {
	        Oferta oferta = this.ofertaService.getOferta(ofertaId);
	        model.addAttribute(oferta);
	        return "/oferta/detailOferta";
	    }
}
