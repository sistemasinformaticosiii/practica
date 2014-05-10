package com.practica.si3.services;

import java.util.List;

import com.practica.si3.domain.Reservation;

public interface ReservationService {

	public void insertData(Reservation reservation);
	public List<Reservation> getReservationList();
	public List<Reservation> getReservationListPorCliente(int id);
	public void updateData(Reservation reservation);
	public void deleteData(String id);
	public Reservation getReservation(String id);

}
