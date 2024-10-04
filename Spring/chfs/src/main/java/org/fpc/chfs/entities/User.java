package org.fpc.chfs.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Date;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="users")
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="user_id")
    private Integer userId;

    @Column(name="first_name")
    private String firstName;

    @Column(name="last_name")
    private String lastName;

    @Transient
    private String username;

    @Column(name="email", unique = true)
    private String email;

    @JsonIgnore
    @Column(name="password")
    private String password;

    @Enumerated(EnumType.STRING)
    private Role role;

    @Column(name="address")
    private String address;

    @Column(name="phone")
    private String phone;

    @Column(name="title")
    private String title;

    @Column(name="bio")
    private String bio;

    @JsonIgnore
    @Column(name="enable")
    private Boolean enable;

    @JsonIgnore
    @Column(name="is_locked")
    private Boolean isLocked;

    @JsonIgnore
    @Column(name="attemps")
    private Integer attemps;

    @JsonIgnore
    @Column(name="using_mfa")
    private Boolean usingMfa;

    @JsonIgnore
    @Column(name="created_on")
    private Date createdOn;

    @JsonIgnore
    @Column(name="image_url")
    private String imageUrl;


    public User(User user){
        this.username = user.getUsername();
        this.password= user.getPassword();
    }
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority(role.name()));
    }

    @Override
    public String getPassword() {
        return null;
    }

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
        return false;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return false;
    }

    @Override
    public boolean isEnabled() {
        return false;
    }
}
