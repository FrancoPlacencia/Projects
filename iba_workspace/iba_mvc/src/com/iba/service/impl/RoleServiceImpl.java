package com.iba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iba.dao.RoleDao;
import com.iba.dao.UserDao;
import com.iba.model.Role;
import com.iba.model.User;
import com.iba.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

	RoleDao roleDao;
	
	@Autowired
	public void setRoleDao(RoleDao roleDao){
		this.roleDao = roleDao;
	}

	@Override
	public List<Role> getAllRoles() {
		return roleDao.getAllRoles();
	}

	@Override
	public void addRole(Role role) {
		roleDao.addRole(role);
	}
	
	

}
