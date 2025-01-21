package com.iba.dao;

import java.util.List;

import com.iba.model.Role;

public interface RoleDao {

	public List<Role> getAllRoles();
	
	public void addRole(Role role);
}
