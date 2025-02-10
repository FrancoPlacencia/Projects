package org.tvmtz.volley_api.user;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.tvmtz.volley_api.common.CommonResponse;
import org.tvmtz.volley_api.user.dto.UserDTO;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    UserService userService;

    // CREATE

    // READ
    @GetMapping("/admin/user")
    public ResponseEntity<UserDTO> getUserForAdmin(@RequestParam String email) {
        return userService.getUser(email);
    }

    @GetMapping("/admin/users")
    public ResponseEntity<List<UserDTO>> getUsersForAdmin() {
        return userService.getUsers();
    }

    @GetMapping("/user")
    public ResponseEntity<UserDTO> getUser(@RequestParam String email) {
        return userService.getUser(email);
    }

    @GetMapping("/users")
    public ResponseEntity<List<UserDTO>> getUsers() {
        return userService.getUsers();
    }

    // UPDATE
    @PatchMapping("/admin/user")
    public ResponseEntity<UserDTO> updateUser(@RequestBody UserDTO request) {
        return userService.updateUser(request);
    }

    // DELETE
    @DeleteMapping("/admin/user")
    public ResponseEntity<CommonResponse> deleteUser(@RequestParam String email) {
        return userService.deleteUser(email);
    }


}
