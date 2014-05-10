package com.practica.si3.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.practica.si3.domain.User;
import com.practica.si3.jdbc.UserRowMapper;

public class UserDaoImpl implements UserDao {

	@Autowired
	DataSource dataSource;

	public void insertData(User user) {

		//Codificamos la password antes de almacenarla en BBDD
		String password = user.getPass();
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(password);
		user.setPass(encodedPassword);
		user.setEnabled(true);
		user.setUsername(user.getEmail());
		
		String sql = "INSERT INTO user "
				+ "(username, enabled, nombre,apellidos,localidad,telefono,email,perfil,pass) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		  
		  
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(
				sql,
				new Object[] { user.getUsername(),user.isEnabled(), user.getNombre(), user.getApellidos(), user.getLocalidad(), user.getTelefono(), user.getEmail(), user.getPerfil(), user.getPass() });
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
	
	@Override
	public User getUserByName(String id) {
		
List<User> userList = new ArrayList<User>();
		
		String sql = "select * from user where username= " + "'" + id + "'";
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		userList = jdbcTemplate.query(sql, new UserRowMapper());
		return userList.get(0);
	}
	
	/**
	 * Comprueba si existe en la BD un usuario con el campo email=id.
	 * @param id - Cadena a consultar en los registros de la BD. Se buscara en el campo email.
	 * @return Devuelve True si hay un usuario cuyo campo email se corresponde con el parametro id. Falso en caso contrario.
	 */
	@Override
	public boolean existUser(String id) {
	
		List<User> userList = new ArrayList<User>();
		
		String sql = "select * from user where email = " + "'" + id + "'";
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		userList = jdbcTemplate.query(sql, new UserRowMapper());
		return !(userList.isEmpty());
	}
	
	/**
	 * Comprueba si existe en la BD un usuario con el campo email=campo1 y pass=campo2
	 * @param campo1 - campo de busqueda uno
	 * @param campo2 - campo de busqueda dos
	 * @return Devuelve True si hay un usuario cuyo campo email y campo pass coinciden con campo1 y campo2 respectivamente.
	 */
	@Override
	public boolean existUser(String campo1, String campo2) {
		
		List<User> userList = new ArrayList<User>();
		
		String sql = "select * from user where email = " + "'" + campo1 + "'" + " AND " + "pass = " + "'" + campo2 + "'";
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		userList = jdbcTemplate.query(sql, new UserRowMapper());
		return !(userList.isEmpty());	
	}

}
