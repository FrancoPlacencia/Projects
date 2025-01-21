package org.fp.ibaweb.service;

import org.fp.ibaweb.Model.Role;
import org.fp.ibaweb.Model.User;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface RoleService {

    public ResponseEntity<List<Role>> getAll();

    public ResponseEntity<Role> getSingle(Role role);

    public ResponseEntity<Role> post(Role role);

    public ResponseEntity<Role> put(Role role);

    public ResponseEntity<Role> patch(Role role);

    public ResponseEntity<Role> delete(Role role);
}
