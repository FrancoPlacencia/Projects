package org.tvmtz.volley_api.auth.service;

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
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.test.context.support.WithMockUser;
import org.tvmtz.volley_api.auth.AuthServiceImpl;
import org.tvmtz.volley_api.auth.dto.LoginRequestDTO;
import org.tvmtz.volley_api.auth.dto.RegisterRequestDTO;
import org.tvmtz.volley_api.common.CommonResponse;
import org.tvmtz.volley_api.user.Role;
import org.tvmtz.volley_api.user.User;
import org.tvmtz.volley_api.user.UserRepository;
import org.tvmtz.volley_api.util.JwtUtil;

import java.util.Date;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@SpringBootTest
@ExtendWith(MockitoExtension.class)
@WithMockUser
public class AuthServiceTest {

    @InjectMocks
    private AuthServiceImpl authService;

    @Mock
    private UserRepository userRepository;

    @Mock
    private Authentication authentication;

    @Mock
    private AuthenticationManager authenticationManager;

    @Mock
    private JwtUtil jwtUtil;

    @Mock
    private PasswordEncoder passwordEncoder;

    private User user;

    private LoginRequestDTO loginRequestDTO;

    private RegisterRequestDTO registerRequestDTO;

    @Test
    @Order(1)
    @DisplayName("LOGIN - NOT FOUND")
    void authLoginNotFoundTest() {
        when(userRepository.findByEmail(loginRequestDTO.getEmail())).thenReturn(Optional.empty());
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
        when(userRepository.findByEmail(loginRequestDTO.getEmail())).thenReturn(Optional.of(user));
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
        when(userRepository.findByEmail(loginRequestDTO.getEmail())).thenReturn(Optional.of(user));
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
        when(userRepository.findByEmail(loginRequestDTO.getEmail())).thenReturn(Optional.of(user));
        when(authentication.isAuthenticated()).thenReturn(false);
        when(authenticationManager.authenticate(any())).thenReturn(authentication);
        ResponseEntity<CommonResponse> response = authService.login(loginRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNull(response.getBody());
    }

    @Test
    @Order(5)
    @DisplayName("LOGIN - LOCK USER")
    void authLoginLockUserTest() {
        String jwtToken = "JWT-TOKEN";
        user.setFailedLogins(3);
        when(userRepository.findByEmail(loginRequestDTO.getEmail())).thenReturn(Optional.of(user));
        when(authentication.isAuthenticated()).thenReturn(false);
        when(authenticationManager.authenticate(any())).thenReturn(authentication);
        ResponseEntity<CommonResponse> response = authService.login(loginRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.LOCKED, response.getStatusCode());
        assertNotNull(response.getBody());
        assertNotNull(response.getBody().getResponse());
        assertEquals("User its locked. Please contact an Admin to unlock your user account.", response.getBody().getResponse());
    }

    @Test
    @Order(6)
    @DisplayName("LOGIN - AUTHENTICATED")
    void authLoginAuthenticatedTest() {
        String jwtToken = "JWT-TOKEN";
        when(userRepository.findByEmail(loginRequestDTO.getEmail())).thenReturn(Optional.of(user));
        when(authentication.isAuthenticated()).thenReturn(true);
        when(authenticationManager.authenticate(any())).thenReturn(authentication);
        when(jwtUtil.generateJWT(authentication)).thenReturn(jwtToken);
        ResponseEntity<CommonResponse> response = authService.login(loginRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertNotNull(response.getBody());
        assertNotNull(response.getBody().getResponse());
        assertEquals(jwtToken, response.getBody().getResponse());
    }

    @Test
    @Order(7)
    @DisplayName("LOGIN - AUTHENTICATED CLEAR ATTEMPTS")
    void authLoginClearAttemptsTest() {
        String jwtToken = "JWT-TOKEN";
        user.setFailedLogins(2);
        when(userRepository.findByEmail(loginRequestDTO.getEmail())).thenReturn(Optional.of(user));
        when(authentication.isAuthenticated()).thenReturn(true);
        when(authenticationManager.authenticate(any())).thenReturn(authentication);
        when(jwtUtil.generateJWT(authentication)).thenReturn(jwtToken);
        ResponseEntity<CommonResponse> response = authService.login(loginRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertNotNull(response.getBody());
        assertNotNull(response.getBody().getResponse());
        assertEquals(jwtToken, response.getBody().getResponse());
    }


    @Test
    @Order(8)
    @DisplayName("REGISTER - MISSING DATA")
    void authRegisterMissingDataTest() {
        registerRequestDTO = RegisterRequestDTO.builder().build();
        ResponseEntity<CommonResponse> response = authService.register(registerRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
    }

    @Test
    @Order(9)
    @DisplayName("REGISTER - EMAIL PATTERN")
    void authRegisterEmailTest() {
        registerRequestDTO.setEmail("@pattern");
        ResponseEntity<CommonResponse> response = authService.register(registerRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNull(response.getBody());

        registerRequestDTO.setEmail("notemail&pattern.com");
        response = authService.register(registerRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNull(response.getBody());
    }

    @Test
    @Order(10)
    @DisplayName("REGISTER - PASSWORD PATTERN")
    void authRegisterPasswordTest() {
        ResponseEntity<CommonResponse> response;
        // Only letters
        registerRequestDTO.setPassword("abcdeABCDE");
        response = authService.register(registerRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNull(response.getBody());

        // Only numbers
        registerRequestDTO.setPassword("1234567890");
        response = authService.register(registerRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNull(response.getBody());

        // Only letters and numbers
        registerRequestDTO.setPassword("abcde12345");
        response = authService.register(registerRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNull(response.getBody());

        // Only special chars
        registerRequestDTO.setPassword("!@#&()?/_*+=<>");
        response = authService.register(registerRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNull(response.getBody());

        // Not meet length
        registerRequestDTO.setPassword("Abc_12$");
        response = authService.register(registerRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNull(response.getBody());
    }

    @Test
    @Order(11)
    @DisplayName("REGISTER - CONFLICT")
    void authRegisterConflictTest() {
        when(passwordEncoder.encode(registerRequestDTO.getPassword())).thenReturn("PASSWORD");
        when(userRepository.findByEmail(registerRequestDTO.getEmail())).thenReturn(Optional.of(user));
        ResponseEntity<CommonResponse> response = authService.register(registerRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.CONFLICT, response.getStatusCode());
        assertNull(response.getBody());
    }

    @Test
    @Order(12)
    @DisplayName("REGISTER - CREATED")
    void authRegisterCreatedTest() {
        User userSaved = user;
        user.setUserId(null);
        userSaved.setUserId(12345);
        when(passwordEncoder.encode(registerRequestDTO.getPassword())).thenReturn("PASSWORD");
        when(userRepository.findByEmail(registerRequestDTO.getEmail())).thenReturn(Optional.empty());
        when(userRepository.save(any())).thenReturn(userSaved);
        ResponseEntity<CommonResponse> response = authService.register(registerRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.CREATED, response.getStatusCode());
        assertNull(response.getBody());
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
        registerRequestDTO = RegisterRequestDTO.builder()
                .firstName("test_firstName")
                .lastName("test_lastName")
                .email("user@example.com")
                .password("T3st&P4$sw0rd")
                .build();
    }


}
