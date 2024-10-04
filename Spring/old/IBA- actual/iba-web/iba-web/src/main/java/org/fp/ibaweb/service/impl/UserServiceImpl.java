package org.fp.ibaweb.service.impl;

import org.fp.ibaweb.Model.User;
import org.fp.ibaweb.repository.UserRepository;
import org.fp.ibaweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserRepository userRepository;

    @Override
    public ResponseEntity<List<User>> getAll() {
        return new ResponseEntity(userRepository.findAll(), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<User> getSingle(User user) {
        Optional<User> optionalUser = userRepository.findById(user.getId());
        if(optionalUser == null){
            return new ResponseEntity(new User(), HttpStatus.UNPROCESSABLE_ENTITY);
        } else {
            return new ResponseEntity(optionalUser.get(), HttpStatus.OK);
        }
    }

    @Override
    public ResponseEntity<User> post(User user) {
        return new ResponseEntity(userRepository.save(user), HttpStatus.CREATED);
    }

    @Override
    public ResponseEntity<User> put(User user) {
        return new ResponseEntity(userRepository.save(user), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<User> patch(User user) {
        return new ResponseEntity(userRepository.save(user), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<User> delete(User user) {
        userRepository.delete(user);
        return new ResponseEntity(new User(), HttpStatus.OK);
    }

    private User save(User user) {
        return userRepository.saveAndFlush(user);
    }
}
