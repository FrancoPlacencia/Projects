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

@SpringBootTest
@ExtendWith(MockitoExtension.class)
@WithMockUser
public class AuthRegisterServiceTest {

    @InjectMocks
    private AuthServiceImpl authService;

    @Mock
    private UserRepository userRepository;

    @Mock
    private Authentication authentication;

    @Mock
    private AuthenticationManager authenticationManager;

    @Mock
    private PasswordEncoder passwordEncoder;

    @Mock
    private JwtUtil jwtUtil;

    private User user;

    private RegisterRequestDTO registerRequestDTO;

    @Test
    @Order(1)
    @DisplayName("REGISTER - MISSING DATA")
    void authRegisterMissingDataTest() {
        registerRequestDTO = RegisterRequestDTO.builder().build();
        ResponseEntity<CommonResponse> response = authService.register(registerRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
    }

    @Test
    @Order(2)
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
    @Order(3)
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
    @Order(4)
    @DisplayName("REGISTER - CONFLICT")
    void authRegisterConflictTest() {
        Mockito.when(userRepository.findByEmail(registerRequestDTO.getEmail())).thenReturn(Optional.of(user));
        ResponseEntity<CommonResponse> response = authService.register(registerRequestDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.CONFLICT, response.getStatusCode());
        assertNull(response.getBody());
    }

    @BeforeEach
    void setup() {
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

        registerRequestDTO = RegisterRequestDTO.builder()
                .firstName("test_firstName")
                .lastName("test_lastName")
                .email("user@example.com")
                .password("T3st&P4$sw0rd")
                .build();
    }
}
