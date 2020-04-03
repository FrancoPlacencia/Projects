package com.iba.dao;

import java.util.List;

import com.iba.model.Registry;

public interface RegistryDao {

	public List<Registry> getAllRegistries();
	
	public void addRegistry(Registry registry);
}
