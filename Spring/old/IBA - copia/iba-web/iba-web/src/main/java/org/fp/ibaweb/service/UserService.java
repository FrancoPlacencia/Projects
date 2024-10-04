package org.fp.ibaweb.service;

import org.fp.ibaweb.Model.User;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface UserService {
    public ResponseEntity<List<User>> getAll();

    public ResponseEntity<User> getSingle(User user);

    public ResponseEntity<User> post(User user);

    ResponseEntity<User> put(User user);

    ResponseEntity<User> patch(User user);
    public ResponseEntity<User> delete(User user);

}
