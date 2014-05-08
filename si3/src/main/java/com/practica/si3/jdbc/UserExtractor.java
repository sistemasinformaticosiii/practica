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
		
		user.setUsername(resultSet.getString(1));
		user.setEnabled(resultSet.getBoolean(2));
		user.setUserId(resultSet.getInt(3));
		user.setNombre(resultSet.getString(4));
		user.setApellidos(resultSet.getString(5));
		user.setLocalidad(resultSet.getString(6));
		user.setTelefono(resultSet.getString(7));
		user.setEmail(resultSet.getString(8));
		user.setPerfil(resultSet.getString(9));
		user.setPass(resultSet.getString(10));
		
		return user;
	}

}
