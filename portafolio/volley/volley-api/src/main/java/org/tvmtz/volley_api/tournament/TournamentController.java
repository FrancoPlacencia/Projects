package org.tvmtz.volley_api.tournament;

import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.tvmtz.volley_api.common.CommonResponse;

import java.util.List;
import java.util.Locale;

@Slf4j
@RestController
@RequestMapping("/api")
public class TournamentController {

    @Autowired
    TournamentService tournamentService;
    @Autowired
    MessageSource messageSource;

    // CREATE , @RequestHeader(name = "Accept-Language", required = false) Locale locale
    @PostMapping("/admin/tournament")
    public ResponseEntity<CommonResponse> createTournament(@Valid @RequestBody TournamentDTO tournament) {
        return tournamentService.createTournament(tournament);
    }

    // READ
    @GetMapping("/tournaments")
    public ResponseEntity<List<TournamentDTO>> getTournaments() {
        return tournamentService.getTournaments();
    }

    @GetMapping("/tournamentById")
    public ResponseEntity<TournamentDTO> getTournament(@RequestParam Integer id) {
        return tournamentService.getTournament(id);
    }

    @GetMapping("/tournament")
    public ResponseEntity<TournamentDTO> getActiveTournament() {
        return tournamentService.getActiveTournament();
    }

    // UPDATE
    @PutMapping("/admin/tournament")
    public ResponseEntity<CommonResponse> updateTournament(@Valid @RequestBody TournamentDTO tournament) {
        return tournamentService.updateTournament(tournament);
    }

    // DELETE
    @DeleteMapping("/admin/tournament")
    public ResponseEntity<CommonResponse> deleteTournament(@RequestParam Integer id) {
        return tournamentService.deleteTournament(id);
    }

    @GetMapping("/hello")
    public String hello() {
        Locale locale = LocaleContextHolder.getLocale();
        return messageSource.getMessage("hello", null, locale);
    }

}
