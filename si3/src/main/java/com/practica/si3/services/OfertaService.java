package com.practica.si3.services;

import java.util.List;

import com.practica.si3.domain.Oferta;



public interface OfertaService {

	public void insertData(Oferta oferta);
	public List<Oferta> getOfertaList();
	public void updateData(Oferta oferta);
	public Oferta getOferta(String id);
	public void deleteData(String id);
	public List<Oferta> getOfertaByProducto(String id);
	public List<Oferta> filterOferta(String tipo, String localidad, String fecha, int precio, int plazas);
	
	/**
	 * Disminuye el campo plazasdisponibles del registro id  en un numero "number" de plazas de la tabla Oferta 
	 * @param id - identificador del registro a actualizar
	 * @param number - valor a disminuir
	 */
	public void decreasePlazasDisponibles(int id, int number);
	
	/**
	 * Incrementa el campo plazasdisponibles del registro id en un numero "number" de plazas de la tabla Oferta.
	 * @param id - identificador de oferta
	 * @param number - numero de plazas a incrementar
	 */
	public void increasePlazasDisponibles(int id, int number);
}
