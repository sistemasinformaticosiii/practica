package com.practica.si3.dao;

import java.util.List;
import java.util.Date;

import com.practica.si3.domain.Oferta;

/**
 * Interface OfertaDao: Define los metodos de acceso a la tabla Oferta definida en la Base de Datos. Aparte de los 
 * metodos CRUD, se definen metodos auxiliares para la obtencion de datos especificos como puedan ser filtros.
 * @author si3
 *
 */

public interface OfertaDao {
	/**
	 * Almacena un registro de la clase Oferta en la BD.
	 * 
	 */
	public void insertData(Oferta oferta);
	/**
	 * Actualiza un registro de la clase Oferta en la BD.
	 * 
	 */
	public void updateData(Oferta oferta);
	/**
	 * Borra un registro de la clase Oferta de la BD.
	 * 
	 */
	public void deleteData(String id);
	/**
	 * Obtiene un listado de todos los registro del tipo Oferta.
	 *
	 */
	public List<Oferta> getOfertasList();
	/**
	 * Obtiene un listado de ofertas por tipo de producto, en base a los criterios fecha y plazas disponibles.
	 * 
	 */
	public List<Oferta> getOfertaByProducto(String tipo);
	public List<Oferta> getOfertaByLocalidad(String localidad);
	public List<Oferta> getOfertaByFecha(Date fecha);
	//devolvera todas aquellas ofertas con precio<=precio
	public List<Oferta> getOfertaByPrecio(double precio);
	//devolvera todas aquellas ofertas con plazas disponibles>=plazas
	public List<Oferta> getOfertaByPlazasDisponibles(int plazas);
	public Oferta getOferta(String id);
}
