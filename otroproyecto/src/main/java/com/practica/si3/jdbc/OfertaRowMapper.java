package com.practica.si3.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.practica.si3.domain.Oferta;

public class OfertaRowMapper implements RowMapper<Oferta> {
	
	@Override
	public Oferta mapRow(ResultSet resultSet, int line) throws SQLException {
		
		OfertaExtractor ofertaExtractor = new OfertaExtractor();
		return ofertaExtractor.extractData(resultSet);
	}

}