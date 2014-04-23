package com.practica.si3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.practica.si3.services.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class BusquedaOfertaControlador {

    //@Autowired
    //private OfertaServiceImpl servicioOferta;

    @RequestMapping(value = "/busqueda", method = RequestMethod.GET)
    public String mostrarFormularioBusqueda(Model model, HttpServletRequest request) {
        
       
        return "busqueda";
    }
    @RequestMapping(value = "/busqueda", method = RequestMethod.POST)
    public String procesarFormulario(Model model, HttpServletRequest request) {
        
       
        return "listado";
    }
}