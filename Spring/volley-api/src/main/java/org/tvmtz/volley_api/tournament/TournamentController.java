package org.tvmtz.volley_api.tournament;

import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/admin")
public class TournamentController {

    @Autowired
    TournamentService tournamentService;

    // CREATE
    @PostMapping("/tournament")
    public ResponseEntity<TournamentDTO> createTournament(@Valid @RequestBody TournamentDTO tournament) {
        return tournamentService.saveTournament(tournament);
    }

    // READ
    @GetMapping("/tournaments")
    public ResponseEntity<List<TournamentDTO>> getTournaments() {
        return tournamentService.getTournaments();
    }

    @GetMapping("/tournament")
    public ResponseEntity<TournamentDTO> getTournament(@RequestParam String uuid) {
        return tournamentService.getTournament(uuid);
    }

    // UPDATE
    @PutMapping("/tournament")
    public ResponseEntity<TournamentDTO> updateTournament(@Valid @RequestBody TournamentDTO tournament) {
        return tournamentService.updateTournament(tournament);
    }

    // DELETE
    @DeleteMapping("/tournament")
    public ResponseEntity<TournamentDTO> deleteTournament(@RequestParam String uuid) {
        return tournamentService.deleteTournament(uuid);
    }

}
