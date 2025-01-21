package org.iba.controller;

import java.util.List;

import org.iba.Service.UserService;
import org.iba.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("users")
    public ResponseEntity<List<User>> getUsers() {
        return userService.getAll();
    }


    
}