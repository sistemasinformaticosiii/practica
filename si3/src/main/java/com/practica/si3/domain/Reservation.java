package com.practica.si3.domain;

public class Reservation {
	
	private int reservationId;
	private int userId;
	private int offerId;
	private String fechaReserva;
	private int plazasReservadas;
	
	
	public void setReservationId(int reservationId) {
		
		this.reservationId = reservationId;
	}
	
	public int getReservationId() {
		
		return reservationId;
	}
	
	public void setUserId(int userId) {
		
		this.userId = userId;
	}
	
	public int getUserId() {
		
		return userId;
	}
	
	public void setOfferId(int offerId) {
		
		this.offerId = offerId;
	}
	
	public int getOfferId() {
		
		return offerId;
	}
	
	public void setFechaReserva(String fechaReserva) {
		
		this.fechaReserva = fechaReserva;
	}
	
	public String getFechaReserva() {
		
		return fechaReserva;
	}
	
	public void setPlazasReservadas(int plazasReservadas) {
		
		this.plazasReservadas = plazasReservadas;
	}
	
	public int getPlazasReservadas() {
		
		return plazasReservadas;
	}
}