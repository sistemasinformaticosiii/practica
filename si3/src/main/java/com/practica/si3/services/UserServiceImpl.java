package com.practica.si3.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.practica.si3.dao.UserDao;
import com.practica.si3.domain.User;


public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userdao;

	@Override
	public void insertData(User user) {
		userdao.insertData(user);
	}

	@Override
	public List<User> getUserList() {
		return userdao.getUserList();
	}

	@Override
	public void deleteData(String id) {
		userdao.deleteData(id);
		
	}

	@Override
	public User getUser(String id) {
		return userdao.getUser(id);
	}
	
	//Modificado por Jose
	@Override
	public User getUserPorNombre(String username) {
		return userdao.getUserPorNombre(username);
	}

	@Override
	public void updateData(User user) {
		userdao.updateData(user);
		
	}
	
	@Override
	public boolean existUser(String id) {
		return userdao.existUser(id);
	}
	
	@Override
	public boolean existUser(String campo1, String campo2) {
		return userdao.existUser(campo1, campo2);
	}

}
