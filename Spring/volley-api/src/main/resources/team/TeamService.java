package team;

import org.springframework.http.ResponseEntity;

import java.util.Map;

public interface TeamService {

    ResponseEntity<CommonResponseDTO> createTeam(Team Team);

    ResponseEntity<CommonResponseDTO> getTeams();

    ResponseEntity<CommonResponseDTO> getTeam(Map<String, String> request);

    ResponseEntity<CommonResponseDTO> updateTeam(Team Team);

    ResponseEntity<CommonResponseDTO> deleteTeam(Team Team);

}
