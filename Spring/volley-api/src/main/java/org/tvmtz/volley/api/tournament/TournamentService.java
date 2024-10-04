package org.tvmtz.volley.api.tournament;

import org.springframework.http.ResponseEntity;
import org.tvmtz.volley.api.team.Team;
import org.tvmtz.volley.api.util.CommonResponseDTO;

import java.util.List;

public interface TournamentService {

    ResponseEntity<CommonResponseDTO> createTournament(Tournament tournament);

    ResponseEntity<List<Tournament>> getTournaments();

    ResponseEntity<Tournament> getTournamentById(Integer id);

    ResponseEntity<Tournament> getTournamentByName(String name);

    ResponseEntity<CommonResponseDTO> uptateTournament(Tournament tournament);

    ResponseEntity<CommonResponseDTO> deleteTournament(Tournament tournament);


}
