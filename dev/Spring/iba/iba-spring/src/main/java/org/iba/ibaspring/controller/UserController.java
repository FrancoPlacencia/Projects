package org.iba.ibaspring.controller;


import java.util.List;

import org.iba.ibaspring.model.User;
import org.iba.ibaspring.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/")
public class UserController {

    @Autowired
    UserService userService;

    @GetMapping("users")
    public List<User> getUsers() {
        return userService.getAll();
    }
    
}