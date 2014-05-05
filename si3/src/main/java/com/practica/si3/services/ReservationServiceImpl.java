package com.practica.si3.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.practica.si3.dao.ReservationDao;
import com.practica.si3.domain.Reservation;

public class ReservationServiceImpl implements ReservationService {

	@Autowired
	ReservationDao reservationdao;
	
	@Override
	public void insertData(Reservation reservation) {
		
		reservationdao.insertData(reservation);
	}

	@Override
	public List<Reservation> getReservationList() {
		
		return reservationdao.getReservationList();
	}

	@Override
	public void updateData(Reservation reservation) {

		reservationdao.updateData(reservation);
	}

	@Override
	public void deleteData(String id) {
		
		reservationdao.deleteData(id);
	}

	@Override
	public Reservation getReservation(String id) {
		
		return reservationdao.getReservation(id);
	}

}
