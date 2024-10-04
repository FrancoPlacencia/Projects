package org.tvmtz.volley.api.team;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/team")
public class TeamComtroller {

    @Autowired
    TeamService teamService;

    @GetMapping("")
    public ResponseEntity<List<Team>> getTeams() {
        return teamService.getAllTeams();
    }
}
