package org.fp.ibaweb.restcontroller;

import org.fp.ibaweb.Model.User;
import org.fp.ibaweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/")
public class UserController {

    @Autowired
    UserService userService;

    @PostMapping("user")
    public ResponseEntity<User> postUser(@RequestBody User user) {
        return userService.post(user);
    }

    @GetMapping("users")
    public ResponseEntity<List<User>> getUsers() {
          return userService.getAll();
    }

    @GetMapping("user")
    public ResponseEntity<User> getUser(@RequestParam(value="userId", required = true) Integer userId) {
        User user = new User();
        user.setId(userId);
        return userService.getSingle(user);
    }
}
