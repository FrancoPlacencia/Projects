package org.tvmtz.volley_api.Tournament;

import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.*;
import org.tvmtz.volley_api.tournament.TournamentDTO;

import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class TournamentRestControllerTest {

    private final String URL = "http://localhost:8082/api";

    private TournamentDTO tournamentDTO;

    @Autowired
    private TestRestTemplate testRestTemplate;

    @BeforeEach
    void setup() {
        tournamentDTO = TournamentDTO.builder()
                .name("Tournament Unit test")
                .year(2000)
                .description("Description Tournament Test")
                .build();
    }


    @Test
    @Order(1)
    @DisplayName("CREATE - [CREATED]")
    void createTest() {
        ResponseEntity<TournamentDTO> response = testRestTemplate.postForEntity(URL + "/tournament", tournamentDTO, TournamentDTO.class);

        assertEquals(HttpStatus.CREATED, response.getStatusCode());
        assertEquals(MediaType.APPLICATION_JSON, response.getHeaders().getContentType());

        TournamentDTO tournamentCreated = response.getBody();
        assertNotNull(tournamentCreated);

        assertEquals(tournamentDTO.getName(), tournamentCreated.getName());
        assertEquals(tournamentDTO.getYear(), tournamentCreated.getYear());
        assertEquals(tournamentDTO.getDescription(), tournamentCreated.getDescription());

        // Special Chars
        String specialChars = "@\"\\|!#$%&/()=?»«@£§€{}.-;'<>_,";
    }

    @Test
    @Order(2)
    @DisplayName("CREATE - [BAD REQUEST] Name")
    void createBadRequestNameTest() {
        // NULL
        tournamentDTO.setName(null);
        ResponseEntity<TournamentDTO> response = testRestTemplate.postForEntity(URL + "/tournament", tournamentDTO, TournamentDTO.class);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertEquals(MediaType.APPLICATION_JSON, response.getHeaders().getContentType());

        // EMPTY
        tournamentDTO.setName("");
        response = testRestTemplate.postForEntity(URL + "/tournament", tournamentDTO, TournamentDTO.class);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertEquals(MediaType.APPLICATION_JSON, response.getHeaders().getContentType());

        // TOO LONG
        tournamentDTO.setName("12345678901234567890123456789012345678901234567890AAA");
        response = testRestTemplate.postForEntity(URL + "/tournament", tournamentDTO, TournamentDTO.class);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertEquals(MediaType.APPLICATION_JSON, response.getHeaders().getContentType());

    }

    @Test
    @Order(3)
    @DisplayName("CREATE - [BAD REQUEST] Year")
    void createBadRequestYearTest() {
        // NULL
        tournamentDTO.setYear(null);
        ResponseEntity<TournamentDTO> response = testRestTemplate.postForEntity(URL + "/tournament", tournamentDTO, TournamentDTO.class);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertEquals(MediaType.APPLICATION_JSON, response.getHeaders().getContentType());

        // NEGATIVE
        tournamentDTO.setYear(-1);
        response = testRestTemplate.postForEntity(URL + "/tournament", tournamentDTO, TournamentDTO.class);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertEquals(MediaType.APPLICATION_JSON, response.getHeaders().getContentType());

        // ZERO
        tournamentDTO.setYear(0);
        response = testRestTemplate.postForEntity(URL + "/tournament", tournamentDTO, TournamentDTO.class);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertEquals(MediaType.APPLICATION_JSON, response.getHeaders().getContentType());

        // BIG NUMBER
        tournamentDTO.setYear(1000000);
        response = testRestTemplate.postForEntity(URL + "/tournament", tournamentDTO, TournamentDTO.class);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertEquals(MediaType.APPLICATION_JSON, response.getHeaders().getContentType());
    }

    @Test
    @Order(4)
    @DisplayName("CREATE - [BAD REQUEST] Description")
    void createBadRequestMissingYearTest() {
        // NULL
        tournamentDTO.setDescription(null);
        ResponseEntity<TournamentDTO> response = testRestTemplate.postForEntity(URL + "/tournament", tournamentDTO, TournamentDTO.class);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertEquals(MediaType.APPLICATION_JSON, response.getHeaders().getContentType());

        // EMPTY
        tournamentDTO.setDescription("");
        response = testRestTemplate.postForEntity(URL + "/tournament", tournamentDTO, TournamentDTO.class);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertEquals(MediaType.APPLICATION_JSON, response.getHeaders().getContentType());

        // TOO LONG
        tournamentDTO.setDescription("1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890AAA");
        response = testRestTemplate.postForEntity(URL + "/tournament", tournamentDTO, TournamentDTO.class);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertEquals(MediaType.APPLICATION_JSON, response.getHeaders().getContentType());
    }

    @Test
    @Order(5)
    @DisplayName("GET ALL - [OK]")
    void getAllTest() {
        ResponseEntity<TournamentDTO[]> responseArray = testRestTemplate.getForEntity(URL + "/tournaments", TournamentDTO[].class);
        assertEquals(HttpStatus.OK, responseArray.getStatusCode());
        assertEquals(MediaType.APPLICATION_JSON, responseArray.getHeaders().getContentType());

        TournamentDTO[] tournamentCreated = responseArray.getBody();
        assertNotNull(tournamentCreated);
    }

    @Test
    @Order(6)
    @DisplayName("GET ONE - [OK]")
    void getOneTest() {
        ResponseEntity<TournamentDTO> response = testRestTemplate.getForEntity(URL + "/tournament", TournamentDTO[].class);
        assertEquals(HttpStatus.OK, responseArray.getStatusCode());
        assertEquals(MediaType.APPLICATION_JSON, responseArray.getHeaders().getContentType());

        TournamentDTO tournamentCreated = responseArray.getBody();
        assertNotNull(tournamentCreated);
    }

    @Test
    @Order(7)
    @DisplayName("UPDATE - [OK]")
    void updateOkTest() {
        tournamentDTO = TournamentDTO.builder()
                .uuid(UUID.fromString("7c4e237e-85ac-11ef-b920-1c1b0de4c2e4"))
                .name("Tournament DB")
                .year(2010)
                .description("Changed by Unit test")
                .build();
        ResponseEntity<TournamentDTO> response = testRestTemplate.exchange(
                URL + "/tournament",
                HttpMethod.PUT,
                new HttpEntity<>(tournamentDTO),
                TournamentDTO.class
        );

        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertEquals(MediaType.APPLICATION_JSON, response.getHeaders().getContentType());

        TournamentDTO tournamentUpdated = response.getBody();
        assertNotNull(tournamentUpdated);
    }

    @Test
    @Order(6)
    @DisplayName("UPDATE - [BAD REQUEST]")
    void updateBadRequestTest() {
        ResponseEntity<TournamentDTO> response = testRestTemplate.exchange(
                URL + "/tournament",
                HttpMethod.PUT,
                new HttpEntity<>(tournamentDTO),
                TournamentDTO.class
        );

        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertEquals(MediaType.APPLICATION_JSON, response.getHeaders().getContentType());

        TournamentDTO tournamentUpdated = response.getBody();
        assertNotNull(tournamentUpdated);
    }

    @Test
    @Order(6)
    @DisplayName("UPDATE - [NOT FOUND]")
    void updateNotFoundTest() {
        tournamentDTO.setUuid(UUID.fromString("12345678-0000-0000-0000-123456789012"));
        ResponseEntity<TournamentDTO> response = testRestTemplate.exchange(
                URL + "/tournament",
                HttpMethod.PUT,
                new HttpEntity<>(tournamentDTO),
                TournamentDTO.class
        );

        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode());
        assertEquals(MediaType.APPLICATION_JSON, response.getHeaders().getContentType());

        TournamentDTO tournamentUpdated = response.getBody();
        assertNotNull(tournamentUpdated);
    }

    @Test
    @Order(7)
    @DisplayName("DELETE - [OK]")
    void deleteOkTest() {

    }


}
