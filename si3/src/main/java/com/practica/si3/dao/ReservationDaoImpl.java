package com.practica.si3.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.practica.si3.domain.Reservation;
import com.practica.si3.jdbc.ReservationRowMapper;

/**
 * Clase ReservationDaoImpl: La clase gestiona (inserta, consulta, actualiza, borra) los accesos a la tabla Reservation de la BD.
 * @author si3
 *
 */
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	DataSource dataSource;

	/**
	 * Inserta una reserva en la BD.
	 * @param reservation Objeto con los datos a insertar en la BD
	 */
	public void insertData(Reservation reservation) {

		String sql = "INSERT INTO reservation "
				+ "(coduser,codoferta,fechareserva,plazasreservadas) VALUES (?, ?, ?, ?)";

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(
				sql,
				new Object[] { reservation.getUserId(), reservation.getOfferId(), reservation.getFechaReserva(), reservation.getPlazasReservadas() });
	}

	/**
	 * Obtiene un listado con todas las reservas existentes en la BD.
	 * @return lista de reservas obtenida de la tabla "reservation" en la BD.
	 */
	public List<Reservation> getReservationList() {
		
		List reservationList = new ArrayList();

		String sql = "select * from reservation";

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		reservationList = jdbcTemplate.query(sql, new ReservationRowMapper());
		return reservationList;
	}

	/**
	 * Elimina una reserva de la BD.
	 * @param id identificador de la reserva a eliminar.
	 */
	@Override
	public void deleteData(String id) {
		
		String sql = "delete from reservation where codreservation=" + id;
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql);

	}

	/**
	 * Actualiza una reserva en la BD.
	 * @param reservation objeto con los datos actualizar.
	 */
	@Override
	public void updateData(Reservation reservation) {

		String sql = "UPDATE reservation set coduser = ?, codoferta = ?, fechareserva = ?, plazasreservadas = ?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(sql, new Object[] { reservation.getUserId(), reservation.getOfferId(), reservation.getFechaReserva(), reservation.getPlazasReservadas() });
	}

	/**
	 * Obtine los datos correspondientes a una reserva de la BD
	 * @param id identificador de la reserva a consultar
	 * @return Reservation objeto con los datos extraidos de la BD correspondientes a la reserva seleccionada.
	 */
	@Override
	public Reservation getReservation(String id) {
		
		List<Reservation> reservationList = new ArrayList<Reservation>();
		
		String sql = "select * from reservation where codreservation= " + id;
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		reservationList = jdbcTemplate.query(sql, new ReservationRowMapper());
		return reservationList.get(0);
	}

}
