package com.fpc.chfs.churchfinancialsystem.user.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fpc.chfs.churchfinancialsystem.church.Church;
import com.fpc.chfs.churchfinancialsystem.shared.dto.CommonResponseDTO;
import com.fpc.chfs.churchfinancialsystem.user.Role;
import com.fpc.chfs.churchfinancialsystem.user.User;
import jakarta.persistence.Column;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserResponseDTO  extends CommonResponseDTO {
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

    private List<Church> churches;

}
