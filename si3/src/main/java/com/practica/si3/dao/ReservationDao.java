package com.practica.si3.dao;

import java.util.List;

import com.practica.si3.domain.Reservation;

/**
 * Interface ReservationDao: Define los metodos de acceso a la tabla Reservation definida en la Base de Datos. A parte de los 
 * metodos CRUD, se definen metodos auxiliares para la obtencion de datos especificos.
 * @author si3
 *
 */
public interface ReservationDao {
	
	public void insertData(Reservation reservation);
	public List<Reservation> getReservationList();
	public void updateData(Reservation reservation);
	public void deleteData(String id);
	public Reservation getReservation(String id);

}
