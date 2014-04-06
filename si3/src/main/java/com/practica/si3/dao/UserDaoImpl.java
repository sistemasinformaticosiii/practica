package com.practica.si3.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.practica.si3.domain.User;
import com.practica.si3.jdbc.UserRowMapper;

public class UserDaoImpl implements UserDao {

	@Autowired
	DataSource dataSource;

	public void insertData(User user) {

		String sql = "INSERT INTO user "
				+ "(nombre,apellidos,localidad,telefono,email,perfil,pass) VALUES (?, ?, ?, ?, ?, ?, ?)";

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(
				sql,
				new Object[] { user.getNombre(), user.getApellidos(), user.getLocalidad(), user.getTelefono(), user.getEmail(), user.getPerfil(), user.getPass() });
	}

	public List<User> getUserList() {
		
		List userList = new ArrayList();

		String sql = "select * from user";

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		userList = jdbcTemplate.query(sql, new UserRowMapper());
		return userList;
	}

	@Override
	public void deleteData(String id) {
		
		String sql = "delete from user where coduser=" + id;
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql);

	}

	@Override
	public void updateData(User user) {

		String sql = "UPDATE user set nombre = ?, apellidos = ?, localidad = ?, telefono = ?, email = ?, perfil = ?, pass = ? where coduser = ?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(sql, new Object[] { user.getNombre(), user.getApellidos(), user.getLocalidad(), user.getTelefono(), 
				user.getEmail(), user.getPerfil(), user.getPass(), user.getUserId() });
	}

	@Override
	public User getUser(String id) {
		
		List<User> userList = new ArrayList<User>();
		
		String sql = "select * from user where coduser= " + id;
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		userList = jdbcTemplate.query(sql, new UserRowMapper());
		return userList.get(0);
	}

}
