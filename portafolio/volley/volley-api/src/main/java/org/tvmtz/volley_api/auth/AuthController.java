package org.tvmtz.volley_api.auth;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.tvmtz.volley_api.auth.dto.LoginRequestDTO;
import org.tvmtz.volley_api.auth.dto.RegisterRequestDTO;
import org.tvmtz.volley_api.common.CommonResponse;

@Slf4j
@RestController
@RequestMapping(path = "/api/auth")
public class AuthController {

    @Autowired
    AuthService authService;

    @PostMapping("login")
    public ResponseEntity<CommonResponse> login(@RequestBody LoginRequestDTO request) {
        return authService.login(request);
    }

    @PostMapping("register")
    public ResponseEntity<CommonResponse> register(@RequestBody RegisterRequestDTO request) {
        return authService.register(request);
    }
}
