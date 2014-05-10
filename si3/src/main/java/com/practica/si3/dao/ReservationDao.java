package com.practica.si3.dao;

import java.util.List;

import com.practica.si3.domain.Reservation;

/**
 * Interface ReservationDao: Define los metodos de acceso a la tabla Reservation definida en la Base de Datos. Aparte de los 
 * metodos CRUD, se definen metodos auxiliares para la obtencion de datos especificos.
 * @author si3
 *
 */
public interface ReservationDao {
	
	/**
	 * Añade un registro de la clase Reservation en la BD
	 * @param reservation - objeto/registro a añadir
	 */
	public void insertData(Reservation reservation);
	
	/**
	 * Obtiene un listado de todos los registros existentes en la tabla "reservation" de la BD.
	 * @return listado de objetos/registro
	 */
	public List<Reservation> getReservationList();
	
	//Añadido por Jose
	
	/**
	 * Obtiene un listado de los registros existentes en la tabla "reservation" de la BD para un cliente determinado.
	 * @return listado de objetos/registro
	 */
	public List<Reservation> getReservationListPorCliente(int id);
	
	/**
	 * Actualiza un registro de la tabla reservation de la BD
	 * @param reservation - registro a actualizar
	 */
	public void updateData(Reservation reservation);
	
	/**
	 * Borra un registro de la tabla reservation de la BD
	 * @param id - identificador de registro a borrar
	 */
	public void deleteData(String id);
	
	/**
	 * Obtiene el registro seleccionado de la tabla reservation de la BD
	 * @param id - identificador de registro a buscar.
	 * @return devuelve el registro seleccionado.
	 */
	public Reservation getReservation(String id);

}
