package com.iba.service.impl;

import java.util.List;

import org.jasypt.util.password.StrongPasswordEncryptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iba.dao.UserDao;
import com.iba.model.User;
import com.iba.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	private final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	UserDao userDao;
	
	@Autowired
	public void setUserDao(UserDao userDao){
		this.userDao = userDao;
	}
	
	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	@Override
	public void addUser(User user) {
		if(user != null && !user.getPassword().isEmpty()) {
			StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
			String passwordEncrypted = passwordEncryptor.encryptPassword(user.getPassword());
			logger.info("encrypted pass " + passwordEncrypted);
			user.setPassword(passwordEncrypted);
		}
		userDao.addUser(user);
	}

	@Override
	public User getUserByEmail(String email) {
		return userDao.getUserByEmail(email);
	}
	
	@Override
	public boolean validateUser(User user) {
		User userDB = userDao.getLoginUser(user);
		logger.info("User " + userDB);
		return compareUserData(userDB, user);
	}
	
	private boolean compareUserData(User userDB, User user) {
		boolean retVal = false;
		// Check for User data
		if(userDB != null && !userDB.getEmail().isEmpty() && !userDB.getPassword().isEmpty()) {
			// Check for LoginUser data
			if(user != null && !user.getEmail().isEmpty() && !user.getPassword().isEmpty()) {
				// Compare User data against LoginUser data
				StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
				if (passwordEncryptor.checkPassword(user.getPassword(), userDB.getPassword())) {
					retVal = true;
				}
			}
		}
		return retVal;
	}

	@Override
	public boolean userExists(User user) {
		User userDb = userDao.getUserByEmail(user.getEmail());
		if(userDb != null) {
			return true;
		} else {
			return false;
		}
	}

}
