package com.iba.dao;

import java.util.List;

import com.iba.model.User;

public interface UserDao {

	public List<User> getAllUsers();
	
	public void addUser(User user);
	
	public User getUser(User user);
	
	public User getUserByEmail(String email);

	public User getLoginUser(User user);
}
