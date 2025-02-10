package dev.learning.spring_security_demo.auth;


import dev.learning.spring_security_demo.auth.dto.AuthResponseDTO;
import dev.learning.spring_security_demo.auth.dto.LoginRequestDTO;
import dev.learning.spring_security_demo.auth.dto.RegisterRequestDTO;
import dev.learning.spring_security_demo.common.CommonResponseDTO;
import org.springframework.http.ResponseEntity;

public interface AuthService {

    ResponseEntity<AuthResponseDTO> login(LoginRequestDTO request);

    ResponseEntity<CommonResponseDTO> register(RegisterRequestDTO request);
/*
    ResponseEntity<CommonResponseDTO> forgot(ForgotRequestDTO request);

    ResponseEntity<CommonResponseDTO> reset(ResetRequestDTO request);

 */
}
