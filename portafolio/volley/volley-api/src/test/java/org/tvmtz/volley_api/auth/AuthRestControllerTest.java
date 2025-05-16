package org.tvmtz.volley_api.auth;


import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.tvmtz.volley_api.auth.dto.RegisterRequestDTO;
import org.tvmtz.volley_api.common.CommonResponse;
import org.tvmtz.volley_api.user.User;
import org.tvmtz.volley_api.user.UserRepository;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class AuthRestControllerTest {

    private final String URL = "http://localhost:";

    @LocalServerPort
    int randomServerPort;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TestRestTemplate testRestTemplate;

    private RegisterRequestDTO registerRequestDTO;

    @BeforeEach
    void setup() {
        User user = userRepository.findByEmail("user@example.com").orElse(null);
        if (user != null) {
            userRepository.delete(user);
        }
        registerRequestDTO = RegisterRequestDTO.builder()
                .firstName("test_firstName")
                .lastName("test_lastName")
                .email("user@example.com")
                .password("T3st&P4$sw0rd")
                .build();
    }


    @Test
    @Order(1)
    @DisplayName("REGISTER - [CREATED]")
    void registerTest() {
        ResponseEntity<CommonResponse> response = testRestTemplate.postForEntity(URL + randomServerPort + "/api/auth/register", registerRequestDTO, CommonResponse.class);
        assertEquals(HttpStatus.CREATED, response.getStatusCode());
    }

    @Test
    @Order(2)
    @DisplayName("REGISTER - [CONFLICT]")
    void registerConflictTest() {
        ResponseEntity<CommonResponse> response = testRestTemplate.postForEntity(URL + randomServerPort + "/api/auth/register", registerRequestDTO, CommonResponse.class);
        assertEquals(HttpStatus.CREATED, response.getStatusCode());
        response = testRestTemplate.postForEntity(URL + randomServerPort + "/api/auth/register", registerRequestDTO, CommonResponse.class);
        assertEquals(HttpStatus.CONFLICT, response.getStatusCode());
    }

    @Test
    @Order(3)
    @DisplayName("REGISTER - [BAD REQUEST]")
    void registerBadRequestTest() {
        registerRequestDTO = RegisterRequestDTO.builder().build();
        ResponseEntity<CommonResponse> response = testRestTemplate.postForEntity(URL + randomServerPort + "/api/auth/register", registerRequestDTO, CommonResponse.class);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
    }


}
