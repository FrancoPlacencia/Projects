package org.tvmtz.volley_api.auth;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.test.context.support.WithMockUser;
import org.tvmtz.volley_api.auth.dto.LoginRequestDTO;
import org.tvmtz.volley_api.common.CommonResponse;
import org.tvmtz.volley_api.user.Role;
import org.tvmtz.volley_api.user.User;
import org.tvmtz.volley_api.user.UserRepository;
import org.tvmtz.volley_api.util.JwtUtil;

import java.util.Date;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;

@SpringBootTest
@ExtendWith(MockitoExtension.class)
@WithMockUser
public class AuthServiceTest {

    @InjectMocks
    private AuthServiceImpl authService;

    @Mock
    private UserRepository userRepository;

    private User user;

    private LoginRequestDTO loginRequestDTO;

    @Mock
    private Authentication authentication;

    @Mock
    private AuthenticationManager authenticationManager;

    @Mock
    private JwtUtil jwtUtil;

    @Test
    @Order(1)
    @DisplayName("LOGIN - NOT FOUND")
    void authLoginNotFoundTest() {
        Mockito.when(userRepository.findByEmail(loginRequestDTO.getEmail())).thenReturn(Optional.empty());
        ResponseEntity<CommonResponse> response = authService.login(loginRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode());
        assertNotNull(response.getBody());
        assertNotNull(response.getBody().getResponse());
        assertEquals("User not found", response.getBody().getResponse());
    }

    @Test
    @Order(2)
    @DisplayName("LOGIN - LOCKED")
    void authLoginLockedTest() {
        user.setIsLocked(true);
        Mockito.when(userRepository.findByEmail(loginRequestDTO.getEmail())).thenReturn(Optional.of(user));
        ResponseEntity<CommonResponse> response = authService.login(loginRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.LOCKED, response.getStatusCode());
        assertNotNull(response.getBody());
        assertNotNull(response.getBody().getResponse());
        assertEquals("User its locked. Please contact an Admin to unlock your user account.", response.getBody().getResponse());
    }

    @Test
    @Order(3)
    @DisplayName("LOGIN - INACTIVE")
    void authLoginInactiveTest() {
        user.setIsActive(false);
        Mockito.when(userRepository.findByEmail(loginRequestDTO.getEmail())).thenReturn(Optional.of(user));
        ResponseEntity<CommonResponse> response = authService.login(loginRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNotNull(response.getBody());
        assertNotNull(response.getBody().getResponse());
        assertEquals("User is inactive.", response.getBody().getResponse());
    }

    @Test
    @Order(4)
    @DisplayName("LOGIN - WRONG CREDENTIALS")
    void authLoginWrongCredentialsTest() {
        String jwtToken = "JWT-TOKEN";
        Mockito.when(userRepository.findByEmail(loginRequestDTO.getEmail())).thenReturn(Optional.of(user));
        Mockito.when(authentication.isAuthenticated()).thenReturn(false);
        Mockito.when(authenticationManager.authenticate(any())).thenReturn(authentication);
        //Mockito.when(jwtUtil.generateJWT(authentication)).thenReturn(jwtToken);
        ResponseEntity<CommonResponse> response = authService.login(loginRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNull(response.getBody());
    }

    @Test
    @Order(5)
    @DisplayName("LOGIN - AUTHENTICATED")
    void authLoginAuthenticatedTest() {
        String jwtToken = "JWT-TOKEN";
        Mockito.when(userRepository.findByEmail(loginRequestDTO.getEmail())).thenReturn(Optional.of(user));
        Mockito.when(authentication.isAuthenticated()).thenReturn(true);
        Mockito.when(authenticationManager.authenticate(any())).thenReturn(authentication);
        Mockito.when(jwtUtil.generateJWT(authentication)).thenReturn(jwtToken);
        ResponseEntity<CommonResponse> response = authService.login(loginRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertNotNull(response.getBody());
        assertNotNull(response.getBody().getResponse());
        assertEquals(jwtToken, response.getBody().getResponse());
    }

    @Test
    @Order(5)
    @DisplayName("LOGIN - AUTHENTICATED")
    void authRegisterAuthenticatedTest() {
    }

    @BeforeEach
    void setup() {
        authentication.setAuthenticated(true);

        user = User.builder()
                .userId(777)
                .username("user")
                .email("user@example.com")
                .password("password")
                .role(Role.USER)
                .firstName("test_firstName")
                .lastName("test_lastName")
                .address("Street 1, City and Country")
                .phone("000-000-00-00")
                .title("TITLE")
                .bio("BIO")
                .isActive(true)
                .createdOn(new Date())
                .isLocked(false)
                .failedLogins(0)
                .forgotToken("")
                .forgotCreatedOn(null)
                .forgotExpiresOn(null)
                .build();
        loginRequestDTO = LoginRequestDTO.builder()
                .email("user@example.com")
                .password("T3st&P4$sw0rd")
                .build();

    }


}
