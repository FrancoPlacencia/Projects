package org.tvmtz.volley_api.team;

import org.springframework.http.ResponseEntity;

import java.util.List;

public interface TeamService {

    ResponseEntity<TeamDTO> createTeam(TeamDTO teamDTO);

    ResponseEntity<List<TeamDTO>> getTeams(String tournamentUuid, String category);

    ResponseEntity<TeamDTO> getTeam(String teamUuid);

    /*
        ResponseEntity<CommonResponseDTO> getTeam(Map<String, String> request);
    */
    ResponseEntity<TeamDTO> updateTeam(TeamDTO teamDTO);

    ResponseEntity<TeamDTO> deleteTeam(String uuid);

}
