package dev.learning.spring_security_demo.auth;


import dev.learning.spring_security_demo.auth.dto.AuthResponseDTO;
import dev.learning.spring_security_demo.auth.dto.LoginRequestDTO;
import dev.learning.spring_security_demo.auth.dto.RegisterRequestDTO;
import dev.learning.spring_security_demo.common.CommonResponseDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/auth")
public class AuthController {

    @Autowired
    AuthService authService;


    @PostMapping("login")
    public ResponseEntity<AuthResponseDTO> login(@RequestBody LoginRequestDTO request) {
        return authService.login(request);
    }

    @PostMapping("register")
    public ResponseEntity<CommonResponseDTO> register(@RequestBody RegisterRequestDTO request) {
        return authService.register(request);
    }
/*
    @PostMapping("forgot-password")
    public ResponseEntity<CommonResponseDTO> forgot(@RequestBody ForgotRequestDTO request) {
        return authService.forgot(request);
    }

    @PostMapping("reset-password")
    public ResponseEntity<CommonResponseDTO> reset(@RequestBody ResetRequestDTO request) {
        return authService.reset(request);
    }
*/
}
