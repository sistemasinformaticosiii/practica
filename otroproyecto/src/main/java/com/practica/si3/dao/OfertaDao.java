package com.practica.si3.dao;

import java.util.List;
import java.util.Date;
import com.practica.si3.domain.Oferta;

public interface OfertaDao {
	
	public void insertData(Oferta oferta);
	public List<Oferta> getOfertasList();
	public List<Oferta> getOfertaByProducto(String tipo);
	public List<Oferta> getOfertaByLocalidad(String localidad);
	public List<Oferta> getOfertaByFecha(Date fecha);
	//devolvera todas aquellas ofertas con precio<=precio
	public List<Oferta> getOfertaByPrecio(double precio);
	//devolvera todas aquellas ofertas con plazas disponibles>=plazas
	public List<Oferta> getOfertaByPlazasDisponibles(int plazas);
	public Oferta getOferta(int id);
}
