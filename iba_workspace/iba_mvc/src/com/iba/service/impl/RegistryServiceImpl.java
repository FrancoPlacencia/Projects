package com.iba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iba.dao.RegistryDao;
import com.iba.model.Registry;
import com.iba.service.RegistryService;

@Service("registryService")
public class RegistryServiceImpl implements RegistryService {

	RegistryDao registryDao;
	
	@Autowired
	public void setRegistryDao(RegistryDao registryDao) {
		this.registryDao = registryDao;
	}

	@Override
	public List<Registry> getAllRegistries() {
		return registryDao.getAllRegistries();
	}

	@Override
	public void addRegistry(Registry registry) {
		registryDao.addRegistry(registry);
	}

}
