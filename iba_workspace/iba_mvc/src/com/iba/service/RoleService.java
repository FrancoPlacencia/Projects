package com.iba.service;

import java.util.List;

import com.iba.model.Role;

public interface RoleService {

	public List<Role> getAllRoles();
	
	public void addRole(Role role);
}
