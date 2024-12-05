package org.tvmtz.volley_api.team;

import org.springframework.http.ResponseEntity;
import org.tvmtz.volley_api.common.CommonResponse;

import java.util.List;

public interface TeamService {

    ResponseEntity<CommonResponse> createTeam(TeamDTO teamDTO);

    ResponseEntity<List<TeamDTO>> getTeams(Integer tournamentId, String category);

    ResponseEntity<TeamDTO> getTeam(Integer teamId);

    ResponseEntity<CommonResponse> updateTeam(TeamDTO teamDTO);

    ResponseEntity<CommonResponse> deleteTeam(Integer teamId);

    ResponseEntity<List<TeamDTO>> getTeamsAll(Integer tournamentId);

    ResponseEntity<List<TeamOptionsDTO>> getTeamOptions(Integer tournamentId);


}
