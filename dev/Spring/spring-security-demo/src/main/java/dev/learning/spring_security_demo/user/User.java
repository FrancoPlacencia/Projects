package dev.learning.spring_security_demo.user;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="users")
@DynamicUpdate
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="user_id")
    private Integer userId;

    // User Identification
    @Transient
    private String username;

    @Column(name="email", unique = true)
    private String email;
    
    @JsonIgnore
    @Column(name="password")
    private String password;

    @Enumerated(EnumType.STRING)
    @Column(name="role")
    private Role role;

    // Personal Information
    @Column(name="first_name")
    private String firstName;

    @Column(name="last_name")
    private String lastName;

    @Column(name="address")
    private String address;

    @Column(name="phone")
    private String phone;

    @Column(name="title")
    private String title;

    @Column(name="bio")
    private String bio;


    @JsonIgnore
    @Column(name="is_active")
    private Boolean isActive;

    @JsonIgnore
    @Column(name="created_on")
    private Date createdOn;

    // Locking Data
    @JsonIgnore
    @Column(name="is_locked")
    private Boolean isLocked;

    @JsonIgnore
    @Column(name="failed_logins")
    private Integer failedLogins;

    @JsonIgnore
    @Column(name="last_failed_login")
    private Date lastFailedLogin;

    // Recovery Password Data
    @JsonIgnore
    @Column(name="forgot_token")
    private String forgotToken;

    @JsonIgnore
    @Column(name="forgot_created_on")
    private Date forgotCreatedOn;

    @JsonIgnore
    @Column(name="forgot_expires_on")
    private Date forgotExpiresOn;


    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        final String ROLE_PREFIX = "ROLE_";
        return List.of(new SimpleGrantedAuthority(ROLE_PREFIX + role.name()));
    }

    // Email instead of username
    @Override
    public String getUsername() {
        return this.email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public String toString() {
        return getClass().getName() + " [" +
                "Username=" + (this.username == null ? this.email : this.username) + ", " +
                "Password=[PROTECTED], " +
                "isActive=" + this.isActive + ", " +
                "isLocked=" + this.isLocked + ", " +
                "attempts=" + this.lastFailedLogin +
                "]";
    }

}
