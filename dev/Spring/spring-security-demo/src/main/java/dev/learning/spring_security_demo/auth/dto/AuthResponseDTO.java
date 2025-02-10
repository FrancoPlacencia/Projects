package dev.learning.spring_security_demo.auth.dto;

import dev.learning.spring_security_demo.common.CommonResponseDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@EqualsAndHashCode(callSuper = true)
@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class AuthResponseDTO extends CommonResponseDTO {
    private String token;
}
