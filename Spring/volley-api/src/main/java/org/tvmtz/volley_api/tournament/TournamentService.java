package org.tvmtz.volley_api.tournament;

import org.springframework.http.ResponseEntity;
import org.tvmtz.volley_api.common.CommonResponseDTO;

import java.util.Map;

public interface TournamentService {

    ResponseEntity<CommonResponseDTO> createTournament(Tournament tournament);

    ResponseEntity<CommonResponseDTO> getTournaments();

    ResponseEntity<CommonResponseDTO> getTournament(Map<String, String> request);

    ResponseEntity<CommonResponseDTO> updateTournament(Tournament tournament);

    ResponseEntity<CommonResponseDTO> deleteTournament(Tournament tournament);


}
