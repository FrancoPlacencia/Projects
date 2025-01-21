package com.fpc.chfs.churchfinancialsystem.auth;

import com.fpc.chfs.churchfinancialsystem.auth.dto.*;
import com.fpc.chfs.churchfinancialsystem.shared.dto.CommonResponseDTO;
import org.springframework.http.ResponseEntity;

public interface AuthService {

    ResponseEntity<AuthResponseDTO> login(LoginRequestDTO request);
    ResponseEntity<CommonResponseDTO> register(RegisterRequestDTO request);

    ResponseEntity<CommonResponseDTO> forgot(ForgotRequestDTO request);

    ResponseEntity<CommonResponseDTO> reset(ResetRequestDTO request);
}
