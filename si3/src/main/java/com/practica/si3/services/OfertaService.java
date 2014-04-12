package com.practica.si3.services;

import java.util.List;

import com.practica.si3.domain.Oferta;



public interface OfertaService {

	public void insertData(Oferta oferta);
	public List<Oferta> getOfertaList();
	public void updateData(Oferta oferta);
	public Oferta getOferta(String id);
}
