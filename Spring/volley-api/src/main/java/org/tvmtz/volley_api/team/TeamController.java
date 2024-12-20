package org.tvmtz.volley_api.team;

import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.tvmtz.volley_api.common.CommonResponse;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api")
public class TeamController {

    @Autowired
    TeamService teamService;

    // CREATE
    @PostMapping("/admin/team")
    public ResponseEntity<CommonResponse> createTeam(@Valid @RequestBody TeamDTO teamDTO) {
        return teamService.createTeam(teamDTO);
    }

    // READ
    @GetMapping("/teams")
    public ResponseEntity<List<TeamDTO>> getTeams(@RequestParam Integer id, @RequestParam String category) {
        return teamService.getTeams(id, category);
    }

    @GetMapping("/standings")
    public ResponseEntity<Map<String, List<StandingDTO>>> getStandings(@RequestParam Integer id) {
        return teamService.getStandings(id);
    }

    @GetMapping("/teamOptions")
    public ResponseEntity<List<TeamOptionsDTO>> getTeamsOptions(@RequestParam Integer id) {
        return teamService.getTeamOptions(id);
    }

    @GetMapping("/team")
    public ResponseEntity<TeamDTO> getTeam(@RequestParam Integer id) {
        return teamService.getTeam(id);
    }

    // UPDATE
    @PutMapping("/admin/team")
    public ResponseEntity<CommonResponse> updateTeam(@Valid @RequestBody TeamDTO teamDTO) {
        return teamService.updateTeam(teamDTO);
    }

    // DELETE
    @DeleteMapping("/admin/team")
    public ResponseEntity<CommonResponse> deleteTeam(@RequestParam Integer id) {
        return teamService.deleteTeam(id);
    }
}
