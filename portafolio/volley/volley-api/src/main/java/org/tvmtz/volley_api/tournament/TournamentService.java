package org.tvmtz.volley_api.tournament;

import org.springframework.http.ResponseEntity;
import org.tvmtz.volley_api.common.CommonResponse;

import java.util.List;
import java.util.Locale;

public interface TournamentService {

    ResponseEntity<CommonResponse> createTournament(TournamentDTO tournament, Locale locale);

    ResponseEntity<List<TournamentDTO>> getTournaments();

    ResponseEntity<TournamentDTO> getTournament(Integer tournamentId);

    ResponseEntity<TournamentDTO> getActiveTournament();

    ResponseEntity<CommonResponse> updateTournament(TournamentDTO tournament);

    ResponseEntity<CommonResponse> deleteTournament(Integer tournamentId);


}
