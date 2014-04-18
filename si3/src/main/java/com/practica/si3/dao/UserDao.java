package com.practica.si3.dao;

import java.util.List;

import com.practica.si3.domain.User;

public interface UserDao {
	
	public void insertData(User user);
	public List<User> getUserList();
	public void updateData(User user);
	public void deleteData(String id);
	public User getUser(String id);
	/**
	 * Comprueba si el usuario con id existe en la BD
	 */
	public boolean existUser(String id);
}
