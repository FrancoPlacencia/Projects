package org.tvmtz.volley_api.tournament;


import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.modelmapper.ModelMapper;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.tvmtz.volley_api.common.CommonResponse;
import org.tvmtz.volley_api.game.GameRepository;
import org.tvmtz.volley_api.util.LocaleMessageUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@SpringBootTest
@ExtendWith(MockitoExtension.class)
public class TournamentServiceTest {

    @InjectMocks
    private TournamentServiceImpl tournamentService;

    @Mock
    private TournamentRepository tournamentRepository;
    @Mock
    private GameRepository gameRepository;
    @Mock
    private ModelMapper modelMapper;
    @Mock
    private LocaleMessageUtil localeMessageUtil;
    @Mock
    private MessageSource messageSource;

    private TournamentDTO tournamentDTO;

    private Tournament tournament;

    @Test
    @Order(1)
    @DisplayName("TOURNAMENT - CREATE [CONFLICT]")
    void testCreateTournamentConflict() {
        String key = "tournament.already_exists";
        when(modelMapper.map(tournamentDTO, Tournament.class)).thenReturn(tournament);
        when(tournamentRepository.findByNameAndYear(tournamentDTO.getName(), tournamentDTO.getYear())).thenReturn(Optional.of(tournament));
        when(localeMessageUtil.getMessage(key)).thenReturn(key);
        ResponseEntity<CommonResponse> response = tournamentService.createTournament(tournamentDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.CONFLICT, response.getStatusCode());
        assertNotNull(response.getBody());
        assertNotNull(response.getBody().getResponse());
        assertEquals(key, response.getBody().getResponse());
    }

    @Test
    @Order(2)
    @DisplayName("TOURNAMENT - CREATE [CREATED]")
    void testCreateTournamentCreated() {
        String key = "tournament.created";
        when(modelMapper.map(tournamentDTO, Tournament.class)).thenReturn(tournament);
        when(tournamentRepository.findByNameAndYear(tournamentDTO.getName(), tournamentDTO.getYear())).thenReturn(Optional.empty());
        when(localeMessageUtil.getMessage(key)).thenReturn(key);
        ResponseEntity<CommonResponse> response = tournamentService.createTournament(tournamentDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.CREATED, response.getStatusCode());
        assertNotNull(response.getBody());
        assertNotNull(response.getBody().getResponse());
        assertEquals(key, response.getBody().getResponse());
    }

    @Test
    @Order(3)
    @DisplayName("TOURNAMENT - GET TOURNAMENTS [EMPTY]")
    void testGetTournamentsEmpty() {
        List<Tournament> emptyTournament = new ArrayList<>();
        List<TournamentDTO> emptyTournamentDto = new ArrayList<>();

        when(tournamentRepository.findAll()).thenReturn(emptyTournament);
        ResponseEntity<List<TournamentDTO>> response = tournamentService.getTournaments();

        assertNotNull(response);
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertNotNull(response.getBody());
        assertEquals(emptyTournamentDto, response.getBody());
    }

    @Test
    @Order(4)
    @DisplayName("TOURNAMENT - GET TOURNAMENTS [LIST]")
    void testGetTournamentsList() {
        List<Tournament> tournaments = new ArrayList<>();
        tournaments.add(tournament);
        List<TournamentDTO> tournamentDtos = new ArrayList<>();
        tournamentDtos.add(tournamentDTO);

        when(tournamentRepository.findAll()).thenReturn(tournaments);
        when(modelMapper.map(tournament, TournamentDTO.class)).thenReturn(tournamentDTO);
        when(gameRepository.getWeeksByTournament(any())).thenReturn(Optional.of(new ArrayList<>()));
        when(gameRepository.getEliminationsByTournament(any())).thenReturn(Optional.of(new ArrayList<>()));
        ResponseEntity<List<TournamentDTO>> response = tournamentService.getTournaments();

        assertNotNull(response);
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertNotNull(response.getBody());
        assertEquals(tournamentDtos, response.getBody());
    }

    @Test
    @Order(5)
    @DisplayName("TOURNAMENT - GET TOURNAMENT [BAD REQUEST]")
    void testGetTournamentBadRequest(){

        ResponseEntity<TournamentDTO> response = tournamentService.getTournament(null);

        assertNotNull(response);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNull(response.getBody());

        response = tournamentService.getTournament(0);

        assertNotNull(response);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNull(response.getBody());

        response = tournamentService.getTournament(-1);

        assertNotNull(response);
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNull(response.getBody());
    }

    @Test
    @Order(6)
    @DisplayName("TOURNAMENT - GET TOURNAMENT [NOT FOUND]")
    void testGetTournamentNotFound(){
        when(tournamentRepository.findByTournamentId(tournamentDTO.getTournamentId())).thenReturn(Optional.empty());
        ResponseEntity<TournamentDTO> response = tournamentService.getTournament(1);

        assertNotNull(response);
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode());
        assertNull(response.getBody());
    }

    @Test
    @Order(7)
    @DisplayName("TOURNAMENT - GET TOURNAMENT [OK]")
    void testGetTournamentOk(){
        when(tournamentRepository.findByTournamentId(tournamentDTO.getTournamentId())).thenReturn(Optional.ofNullable(tournament));
        when(modelMapper.map(tournament, TournamentDTO.class)).thenReturn(tournamentDTO);
        when(gameRepository.getWeeksByTournament(any())).thenReturn(Optional.of(new ArrayList<>()));
        when(gameRepository.getEliminationsByTournament(any())).thenReturn(Optional.of(new ArrayList<>()));
        ResponseEntity<TournamentDTO> response = tournamentService.getTournament(1);

        assertNotNull(response);
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertNotNull(response.getBody());
        assertEquals(tournamentDTO, response.getBody());
    }

    @Test
    @Order(8)
    @DisplayName("TOURNAMENT - GET TOURNAMENT [OK]")
    void testGetActiveTournamentNotFound() {
        when(tournamentRepository.findActive()).thenReturn(Optional.empty());

        ResponseEntity<TournamentDTO> response = tournamentService.getActiveTournament();

        assertNotNull(response);
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode());
        assertNull(response.getBody());
    }

    @Test
    @Order(9)
    @DisplayName("TOURNAMENT - GET TOURNAMENT [OK]")
    void testGetActiveTournamentOk() {
        when(tournamentRepository.findActive()).thenReturn(Optional.ofNullable(tournament));
        when(modelMapper.map(tournament, TournamentDTO.class)).thenReturn(tournamentDTO);
        when(gameRepository.getWeeksByTournament(any())).thenReturn(Optional.of(new ArrayList<>()));
        when(gameRepository.getEliminationsByTournament(any())).thenReturn(Optional.of(new ArrayList<>()));

        ResponseEntity<TournamentDTO> response = tournamentService.getActiveTournament();

        assertNotNull(response);
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertNotNull(response.getBody());
        assertEquals(tournamentDTO, response.getBody());
    }


    @BeforeEach
    void setup() {
        tournamentDTO = TournamentDTO.builder()
                .tournamentId(1)
                .name("Name Tournament Test")
                .year(2000)
                .description("Description Tournament Test")
                .rounds(2)
                .stage("TEST")
                .regularSets(3)
                .eliminationSets(5)
                .femElimination(6)
                .varElimination(6)
                .mixElimination(8)
                .url("TEST URL")
                .isActive(true)
                .build();
        tournament = Tournament.builder()
                .tournamentId(1)
                .name("Name Tournament Test")
                .year(2000)
                .description("Description Tournament Test")
                .rounds(2)
                .stage("TEST")
                .regularSets(3)
                .eliminationSets(5)
                .femElimination(6)
                .varElimination(6)
                .mixElimination(8)
                .url("TEST URL")
                .isActive(true)
                .build();
    }
}
