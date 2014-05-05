package com.practica.si3.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.practica.si3.domain.Reservation;

public class ReservationExtractor implements ResultSetExtractor<Reservation> {

	public Reservation extractData(ResultSet resultSet) throws SQLException,
			DataAccessException {
		
		Reservation reservation = new Reservation();
		
		reservation.setReservationId(resultSet.getInt(1));
		reservation.setUserId(resultSet.getInt(2));
		reservation.setOfferId(resultSet.getInt(3));
		reservation.setFechaReserva(resultSet.getString(4));
		reservation.setPlazasReservadas(resultSet.getInt(5));
		
		return reservation;
	}

}
