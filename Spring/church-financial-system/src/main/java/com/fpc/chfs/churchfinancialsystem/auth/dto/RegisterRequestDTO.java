package com.fpc.chfs.churchfinancialsystem.auth.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RegisterRequestDTO {
    private String firstName;

    private String lastName;

    private String email;
    
    private String password;

    private String title;

    private String bio;
}
