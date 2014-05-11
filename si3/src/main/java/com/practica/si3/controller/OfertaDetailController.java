package com.practica.si3.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.practica.si3.domain.Oferta;
import com.practica.si3.services.OfertaService;

@Controller
public class OfertaDetailController {

	@Autowired
	OfertaService ofertaService;
	
//	 @RequestMapping(value = "/detailOferta/{ofertaId}")
//	    public String details(@PathVariable("ofertaId") String ofertaId, Model model) {
//	        Oferta oferta = this.ofertaService.getOferta(ofertaId);
//	        model.addAttribute(oferta);
//	        return "/oferta/detailOferta";
//	    }

	 @RequestMapping(value = "/detailOferta", method=RequestMethod.GET)
	    public String details(@RequestParam String id, Model model) {
	        Oferta oferta = this.ofertaService.getOferta(id);
	        model.addAttribute(oferta);
	        return "/oferta/detailOferta";
	    }	 	

//	 @RequestMapping(value = "/proveedor/detailOferta/{ofertaId}")
//	    public String detailsProveedor(@PathVariable("ofertaId") String ofertaId, Model model) {
//	        Oferta oferta = this.ofertaService.getOferta(ofertaId);
//	        model.addAttribute(oferta);
//	        return "/proveedor/detailOferta";
//	    }
	 
	 @RequestMapping(value = "/proveedor/detailOferta", method=RequestMethod.GET)
	    public String detailsProveedor(@RequestParam String id, Model model) {
	        Oferta oferta = this.ofertaService.getOferta(id);
	        model.addAttribute(oferta);
	        return "/proveedor/detailOferta";
	    }	 
	 
//	 @RequestMapping(value = "/proveedor/editOferta/{ofertaId}")
//	    public String edit(@PathVariable("ofertaId") String ofertaId, Model model) {
//	        Oferta oferta = this.ofertaService.getOferta(ofertaId);
//	        model.addAttribute(oferta);
//	        return "/proveedor/editOferta";
//	    }
	 
	 @RequestMapping(value = "/proveedor/editOferta", method=RequestMethod.GET)
	    public String edit(@RequestParam String id, Model model) {
	        Oferta oferta = this.ofertaService.getOferta(id);
	        model.addAttribute(oferta);
	        return "/proveedor/editOferta";
	    }	 
}
