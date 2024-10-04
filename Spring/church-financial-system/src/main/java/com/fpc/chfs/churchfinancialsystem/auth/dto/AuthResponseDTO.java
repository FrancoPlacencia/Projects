package com.fpc.chfs.churchfinancialsystem.auth.dto;

import com.fpc.chfs.churchfinancialsystem.shared.dto.CommonResponseDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AuthResponseDTO extends CommonResponseDTO {
    private String token;
}
