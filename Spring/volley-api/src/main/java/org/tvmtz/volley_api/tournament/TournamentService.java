package org.tvmtz.volley_api.tournament;

import org.springframework.http.ResponseEntity;

import java.util.List;

public interface TournamentService {

    ResponseEntity<TournamentDTO> saveTournament(TournamentDTO tournament);

    ResponseEntity<List<TournamentDTO>> getTournaments();

    //ResponseEntity<TournamentDTO> getTournamentByUUID(String uuid);

    ResponseEntity<TournamentDTO> getTournament(String uuid);

    ResponseEntity<TournamentDTO> updateTournament(TournamentDTO tournament);

    ResponseEntity<TournamentDTO> deleteTournament(String uuid);

}
