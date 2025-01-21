package org.iba.Service;

import java.util.List;

import org.iba.model.User;
import org.iba.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public ResponseEntity<List<User>> getAll(){
        return new ResponseEntity<List<User>>(userRepository.findAll(), HttpStatus.OK);
    }
}
