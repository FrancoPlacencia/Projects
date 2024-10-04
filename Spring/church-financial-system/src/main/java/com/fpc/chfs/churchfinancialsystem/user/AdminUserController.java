package com.fpc.chfs.churchfinancialsystem.user;

import com.fpc.chfs.churchfinancialsystem.user.dto.UpdateUserRequestDTO;
import com.fpc.chfs.churchfinancialsystem.user.dto.UserResponseDTO;
import com.fpc.chfs.churchfinancialsystem.shared.dto.CommonResponseDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@Slf4j
@RestController
@RequestMapping("/api/admin")
public class AdminUserController {


    @Autowired
    UserService userService;
    @GetMapping("/user")
    public ResponseEntity<UserResponseDTO> getUser(@RequestParam String email) {
        return userService.getUserForAdmin(email);
    }

    @GetMapping("/users")
    public ResponseEntity<List<UserResponseDTO>> getUserList() {
        return userService.getUsersForAdmin();
    }


    @DeleteMapping("/user")
    public ResponseEntity<CommonResponseDTO> deleteUser(@RequestParam String email) {
        log.info("deleteUser {}",email);
        return userService.deleteUser(email);
    }

    @PatchMapping("/user")
    public ResponseEntity<UserResponseDTO> updateUser(@RequestBody UpdateUserRequestDTO request) {
        log.info("updateUser {}", request);
        return userService.updateUser(request);
    }

}
