package org.tvmtz.volley_api.team;

import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/admin")
public class TeamController {

    @Autowired
    TeamService teamService;

    // CREATE
    @PostMapping("/team")
    public ResponseEntity<TeamDTO> createTeam(@Valid @RequestBody TeamDTO teamDTO) {
        return teamService.createTeam(teamDTO);
    }

    // READ
    @GetMapping("/teams")
    public ResponseEntity<List<TeamDTO>> getTeams(@RequestParam String uuid, @RequestParam String category) {
        return teamService.getTeams(uuid, category);
    }

    @GetMapping("/team")
    public ResponseEntity<TeamDTO> getTeam(@RequestParam String uuid) {
        return teamService.getTeam(uuid);
    }

    // UPDATE
    @PutMapping("/team")
    public ResponseEntity<TeamDTO> updateTeam(@Valid @RequestBody TeamDTO teamDTO) {
        return teamService.updateTeam(teamDTO);
    }

    // DELETE
    @DeleteMapping("/team")
    public ResponseEntity<TeamDTO> deleteTeam(@RequestParam String uuid) {
        return teamService.deleteTeam(uuid);
    }
}
