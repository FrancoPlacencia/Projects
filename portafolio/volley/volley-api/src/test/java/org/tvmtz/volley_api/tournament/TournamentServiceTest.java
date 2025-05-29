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
import org.tvmtz.volley_api.util.LocaleMessageUtil;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.Mockito.when;

@SpringBootTest
@ExtendWith(MockitoExtension.class)
public class TournamentServiceTest {
    @Mock
    MessageSource messageSource;
    @InjectMocks
    private TournamentServiceImpl tournamentService;
    @Mock
    private TournamentRepository tournamentRepository;
    @Mock
    private ModelMapper modelMapper;
    @Mock
    private LocaleMessageUtil localeMessageUtil;
    private TournamentDTO tournamentDTO;

    private Tournament tournament;

    @Test
    @Order(1)
    @DisplayName("TOURNAMENT - CREATE [CONFLICT]")
    void tournamentCreateConflictTest() {
        String key = "tournament.already_exists";
        when(modelMapper.map(tournamentDTO, Tournament.class)).thenReturn(tournament);
        when(tournamentRepository.findByNameAndYear(tournamentDTO.getName(), tournamentDTO.getYear())).thenReturn(Optional.of(tournament));
        when(localeMessageUtil.getMessage(key)).thenReturn(key);
        ResponseEntity<CommonResponse> response = tournamentService.createTournament(tournamentDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.CONFLICT, response.getStatusCode());
        assertNotNull(response.getBody());
        assertNotNull(response.getBody().getResponse());
        assertEquals(response.getBody().getResponse(), key);
    }

    @Test
    @Order(2)
    @DisplayName("TOURNAMENT - CREATE [CREATED]")
    void tournamentCreateTest() {
        String key = "tournament.created";
        when(modelMapper.map(tournamentDTO, Tournament.class)).thenReturn(tournament);
        when(tournamentRepository.findByNameAndYear(tournamentDTO.getName(), tournamentDTO.getYear())).thenReturn(Optional.empty());
        when(localeMessageUtil.getMessage(key)).thenReturn(key);
        ResponseEntity<CommonResponse> response = tournamentService.createTournament(tournamentDTO);

        assertNotNull(response);
        assertEquals(HttpStatus.CREATED, response.getStatusCode());
        assertNotNull(response.getBody());
        assertNotNull(response.getBody().getResponse());
        assertEquals(response.getBody().getResponse(), key);
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
