package org.tvmtz.volley_api.user.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.tvmtz.volley_api.user.Role;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
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

