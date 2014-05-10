package com.practica.si3.dao;

import java.util.List;

import com.practica.si3.domain.CriterioBusqueda;
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
	 * Incrementa el campo plazasdisponibles del registro id en un numero "number" de plazas de la tabla Oferta.
	 */
	public void increasePlazasDisponibles(int id, int number);
	
	/**
	 * Disminuye el campo plazasdisponibles del registro id  en un numero "number" de plazas de la tabla Oferta
	 */
	public void decreasePlazasDisponibles(int id, int number);
	
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
	 * Obtiene un listado de ofertas por tipo de perfil, en base a los criterios fecha y plazas disponibles.
	 * 
	 */
	public List<Oferta> getOfertaByPerfil(int tipo);
	/**
	 * Obtiene un listado de ofertas por localidad, en base a los criterios fecha y plazas disponibles
	 * @param criterioBusqueda TODO
	 * 
	 */
	
	public List<Oferta> getOfertaByProductoVigente(String tipo);
	
	public List<Oferta> filterOferta(CriterioBusqueda criterioBusqueda);

	public Oferta getOferta(String id);
}
