package org.tvmtz.volley_api.auth;

import org.springframework.http.ResponseEntity;
import org.tvmtz.volley_api.auth.dto.LoginRequestDTO;
import org.tvmtz.volley_api.auth.dto.RegisterRequestDTO;
import org.tvmtz.volley_api.common.CommonResponse;

public interface AuthService {
    ResponseEntity<CommonResponse> login(LoginRequestDTO request);

    ResponseEntity<CommonResponse> register(RegisterRequestDTO request);
}
