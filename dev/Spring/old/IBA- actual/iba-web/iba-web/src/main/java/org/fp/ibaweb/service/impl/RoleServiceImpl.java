package org.fp.ibaweb.service.impl;

import org.fp.ibaweb.Model.Role;
import org.fp.ibaweb.repository.RoleRepository;
import org.fp.ibaweb.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleRepository roleRepository;

    @Override
    public ResponseEntity<List<Role>> getAll() {
        return new ResponseEntity(roleRepository.findAll(), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<Role> getSingle(Role role) {
        Optional<Role> optionalRole = roleRepository.findById(role.getId());
        if (optionalRole == null) {
            return new ResponseEntity(role, HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity(optionalRole.get(), HttpStatus.OK);
        }
    }

    @Override
    public ResponseEntity<Role> post(Role role) {
        if (role.getId() == null) {
            return new ResponseEntity(save(role), HttpStatus.CREATED);
        } else {
            Optional<Role> optionalRole = roleRepository.findById(role.getId());
            if (optionalRole == null) {
                return new ResponseEntity(save(role), HttpStatus.CREATED);
            } else {
                return new ResponseEntity(role, HttpStatus.METHOD_NOT_ALLOWED);
            }
        }
    }

    @Override
    public ResponseEntity<Role> put(Role role) {
        return new ResponseEntity(save(role), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<Role> patch(Role role) {
        return new ResponseEntity(save(role), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<Role> delete(Role role) {
        roleRepository.delete(role);
        return new ResponseEntity(new Role(), HttpStatus.NO_CONTENT);
    }

    private Role save(Role role) {
        return roleRepository.saveAndFlush(role);
    }
}


