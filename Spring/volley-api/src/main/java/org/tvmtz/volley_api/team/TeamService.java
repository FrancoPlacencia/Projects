package org.tvmtz.volley_api.team;

import org.springframework.http.ResponseEntity;
import org.tvmtz.volley_api.common.CommonResponse;

import java.util.List;
import java.util.Map;

public interface TeamService {

    ResponseEntity<CommonResponse> createTeam(TeamDTO teamDTO);

    ResponseEntity<List<StandingDTO>> getStandings(Integer id, String category);

    ResponseEntity<Map<String, List<StandingDTO>>> getStandings(Integer id);

    ResponseEntity<List<TeamDTO>> getTeams(Integer tournamentId, String category);

    ResponseEntity<TeamDTO> getTeam(Integer teamId);

    ResponseEntity<CommonResponse> updateTeam(TeamDTO teamDTO);

    ResponseEntity<CommonResponse> deleteTeam(Integer teamId);

    ResponseEntity<List<TeamOptionsDTO>> getTeamOptions(Integer tournamentId);


}
