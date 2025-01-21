package com.iba.service;

import java.util.List;

import com.iba.model.User;

public interface UserService {

	public List<User> getAllUsers();
	
	public void addUser(User user);
	
	public User getUserByEmail(String email);

	public boolean validateUser(User user);
	
	public boolean userExists(User user);
}
