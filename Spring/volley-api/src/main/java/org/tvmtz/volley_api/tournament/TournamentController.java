package org.tvmtz.volley_api.tournament;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.tvmtz.volley_api.common.CommonResponseDTO;

import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api")
public class TournamentController {

    @Autowired
    TournamentService tournamentService;

    // CREATE
    @PostMapping("/tournament")
    public ResponseEntity<CommonResponseDTO> createTournament(@RequestBody Tournament tournament) {
        return tournamentService.createTournament(tournament);

    }

    // READ
    @GetMapping("/tournaments")
    public ResponseEntity<CommonResponseDTO> getTournaments() {
        return tournamentService.getTournaments();
    }

    @GetMapping("/tournament")
    public ResponseEntity<CommonResponseDTO> getTournament(@RequestParam Map<String, String> request) {
        return tournamentService.getTournament(request);
    }

    // UPDATE
    @PutMapping("/tournament")
    public ResponseEntity<CommonResponseDTO> updateTournament(@RequestBody Tournament tournament) {
        return tournamentService.updateTournament(tournament);
    }

    // DELETE
    @DeleteMapping("/tournament")
    public ResponseEntity<CommonResponseDTO> deleteTournament(@RequestBody Tournament tournament) {
        return tournamentService.deleteTournament(tournament);
    }
}
