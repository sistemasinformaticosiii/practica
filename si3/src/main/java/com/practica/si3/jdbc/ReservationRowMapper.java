package com.practica.si3.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.practica.si3.domain.Reservation;

public class ReservationRowMapper implements RowMapper<Reservation> {

	@Override
	public Reservation mapRow(ResultSet resultSet, int line) throws SQLException {
		ReservationExtractor reservationExtractor = new ReservationExtractor();
		return reservationExtractor.extractData(resultSet);
	}

}
