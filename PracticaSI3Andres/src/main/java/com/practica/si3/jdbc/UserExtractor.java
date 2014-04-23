package com.practica.si3.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.practica.si3.domain.User;

public class UserExtractor implements ResultSetExtractor<User> {

	public User extractData(ResultSet resultSet) throws SQLException,
			DataAccessException {
		
		User user = new User();
		
		user.setUserId(resultSet.getInt(1));
		user.setNombre(resultSet.getString(2));
		user.setApellidos(resultSet.getString(3));
		user.setLocalidad(resultSet.getString(4));
		user.setTelefono(resultSet.getString(5));
		user.setEmail(resultSet.getString(6));
		user.setPerfil(resultSet.getString(7));
		user.setPass(resultSet.getString(8));
		
		return user;
	}

}
