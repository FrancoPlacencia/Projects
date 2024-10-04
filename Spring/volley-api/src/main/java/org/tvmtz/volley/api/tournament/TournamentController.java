package org.tvmtz.volley.api.tournament;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.tvmtz.volley.api.util.CommonResponseDTO;

import java.util.List;

@RestController
@RequestMapping("/api")
public class TournamentController {

    @Autowired
    TournamentService tournamentService;

    // CREATE
    @PostMapping("/tournament")
    public ResponseEntity<CommonResponseDTO> createTournament(@RequestBody Tournament tournament){
        return tournamentService.createTournament(tournament);

    }

    // READ
    @GetMapping("/tournaments")
    public ResponseEntity<List<Tournament>> getTournaments() {
        return tournamentService.getTournaments();
    }

    @GetMapping("/tournament")
    public ResponseEntity<Tournament> getTournamentById(@RequestParam Integer id) {
        return tournamentService.getTournamentById(id);
    }
/*
    @GetMapping("/tournament")
    public ResponseEntity<Tournament> getTournamentByName(@RequestParam String name) {
        return tournamentService.getTournamentByName(name);
    }
*/
    // UPDATE
    @PutMapping("/tournament")
    public ResponseEntity<CommonResponseDTO> updateTournament(@RequestBody Tournament tournament) {
        return tournamentService.uptateTournament(tournament);
    }

    // DELETE
    @DeleteMapping("/tournament")
    public ResponseEntity<CommonResponseDTO> deleteTournament(@RequestBody Tournament tournament) {
        return tournamentService.deleteTournament(tournament);
    }
}
