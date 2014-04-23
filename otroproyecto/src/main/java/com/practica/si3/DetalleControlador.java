package com.practica.si3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.practica.si3.services.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DetalleControlador {

    //@Autowired
    //private OfertaServiceImpl servicioOferta;

    @RequestMapping(value = "/detalle", method = RequestMethod.GET)
    public String mostrarDetalle(Model model, HttpServletRequest request) {
        
       
        return "detalle";
    }
    
}