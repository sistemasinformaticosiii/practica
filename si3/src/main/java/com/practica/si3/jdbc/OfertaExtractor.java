package com.practica.si3.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import com.practica.si3.domain.Oferta;


public class OfertaExtractor implements ResultSetExtractor<Oferta> {
	
	public Oferta extractData(ResultSet resultSet) throws SQLException, DataAccessException {
		
		Oferta oferta = new Oferta();
		
		oferta.setCodOferta(resultSet.getInt(1));
		oferta.setCodUsuario(resultSet.getInt(2));
		oferta.setTipo(resultSet.getString(3));
		oferta.setCategoria(resultSet.getString(4));
		oferta.setTitulo(resultSet.getString(5));
		oferta.setFechaInicio(resultSet.getDate(6));
		oferta.setFechaFin(resultSet.getDate(7));
		oferta.setLocalidad(resultSet.getString(8));
		oferta.setDireccion(resultSet.getString(9));
		oferta.setDescripcion(resultSet.getString(10));
		oferta.setPlazasTotal(resultSet.getInt(11));
		oferta.setPlazasDisponibles(resultSet.getInt(12));
		oferta.setPrecio(resultSet.getFloat(13));
		oferta.setDescuento(resultSet.getFloat(14));
		
		return oferta;
	}

}
