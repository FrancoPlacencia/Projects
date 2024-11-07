package org.tvmtz.volley_api.Tournament;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.tvmtz.volley_api.tournament.Tournament;
import org.tvmtz.volley_api.tournament.TournamentRepository;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;


@DataJpaTest
public class TournamentJPATest {
    @Autowired
    private TournamentRepository tournamentRepository;

    private Tournament tournament;

    @BeforeEach
    void setup() {
        tournament = Tournament.builder()
                .name("Torneo Test")
                .year(2000)
                .description("Description Tournamen Test")
                .build();
    }

    @DisplayName("CREATE Test")
    @Test
    void createTest() {
        Tournament tournamentDb = tournamentRepository.save(tournament);
        assertThat(tournamentDb).isNotNull();
        assertThat(tournamentDb.getTournamentId()).isGreaterThan(0);
    }

    @DisplayName("READ All Test")
    @Test
    void readAllTest() {
        tournamentRepository.save(tournament);
        List<Tournament> tournaments = tournamentRepository.findAll();
        assertThat(tournaments).isNotNull();
        assertThat(tournaments.size()).isGreaterThan(1);
    }

    @DisplayName("READ By ID Test")
    @Test
    void readByIdTest() {
        tournamentRepository.save(tournament);
        Tournament tournamentDb = tournamentRepository.findByTournamentId(tournament.getTournamentId()).orElse(null);
        assertThat(tournamentDb).isNotNull();
        assertThat(tournamentDb.getTournamentId()).isEqualTo(tournament.getTournamentId());
    }

    @DisplayName("READ By UUID Test")
    @Test
    void readByUuidTest() {
        tournamentRepository.save(tournament);
        Tournament tournamentDb = tournamentRepository.findByTournamentId(tournament.getTournamentId()).orElse(null);
        System.out.println("tournament " + tournament);

        assertThat(tournamentDb).isNotNull();
        System.out.println("tournamentDb " + tournamentDb);
        assertThat(tournamentDb.getTournamentId()).isEqualTo(tournament.getTournamentId());
    }
}
