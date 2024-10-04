package com.fpc.chfs.churchfinancialsystem.user;

import com.fpc.chfs.churchfinancialsystem.user.dto.UserRequestDTO;
import com.fpc.chfs.churchfinancialsystem.user.dto.UserResponseDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    UserService userService;

    @GetMapping("/user")
    public ResponseEntity<UserResponseDTO> getUser(@RequestBody UserRequestDTO userRequestDTO) {
        return userService.getUserForAdmin(userRequestDTO.getEmail());
    }

    @GetMapping("/users")
    public ResponseEntity<List<UserResponseDTO>> getUsers() {
        return userService.getUsersForAdmin();
    }
}
