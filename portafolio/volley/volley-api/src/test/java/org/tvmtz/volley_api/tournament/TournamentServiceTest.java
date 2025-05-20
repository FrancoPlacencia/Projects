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
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.tvmtz.volley_api.common.CommonResponse;

import java.util.Locale;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@SpringBootTest
@ExtendWith(MockitoExtension.class)
public class TournamentServiceTest {

    @InjectMocks
    private TournamentServiceImpl tournamentService;

    @Mock
    private TournamentRepository tournamentRepository;

    @Mock
    private ModelMapper modelMapper;

    @Mock
    private MessageSource messageSource;

    @Mock
    private Locale locale;

    private TournamentDTO tournamentDTO;

    private Tournament tournament;

    @Test
    @Order(1)
    @DisplayName("TOURNAMENT - CREATE [CONFLICT]")
    void tournamentCreateConflictTest(){
        Locale locale = LocaleContextHolder.getLocale();
        when(modelMapper.map(tournamentDTO, Tournament.class)).thenReturn(tournament);
        when(tournamentRepository.findByNameAndYear(tournamentDTO.getName(), tournamentDTO.getYear())).thenReturn(Optional.of(tournament));
        ResponseEntity<CommonResponse> response = tournamentService.createTournament(tournamentDTO, locale);

        assertNotNull(response);
        assertEquals(HttpStatus.CONFLICT, response.getStatusCode());
        assertNotNull(response.getBody());
        assertNotNull(response.getBody().getResponse());
        assertEquals(messageSource.getMessage("tournament.already_exists", null, Locale.US), response.getBody().getResponse());
    }

    @BeforeEach
    void setup(){
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
