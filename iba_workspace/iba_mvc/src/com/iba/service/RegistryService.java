package com.iba.service;

import java.util.List;

import com.iba.model.Category;
import com.iba.model.Registry;

public interface RegistryService {

	public List<Registry> getAllRegistries();
	
	public void addRegistry(Registry registry);
}
