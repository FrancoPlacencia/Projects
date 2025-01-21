package com.fpc.chfs.churchfinancialsystem.user.dto;

import com.fpc.chfs.churchfinancialsystem.user.Role;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UpdateUserRequestDTO {


    private Integer userId;

    private String firstName;

    private String lastName;

    private String email;

    private Role role;

    private String address;

    private String phone;

    private String title;

    private String bio;

    private Boolean isActive;

    private Boolean isLocked;

    private Integer attempts;

    private Boolean usingMfa;

    private Date createdOn;

    private String imageUrl;
}
