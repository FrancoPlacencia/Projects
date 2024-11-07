package team;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api")
public class TeamController {

    @Autowired
    TeamService teamService;

    // CREATE
    @PostMapping("team")
    public ResponseEntity<CommonResponseDTO> createTeam(@RequestBody Team team) {
        return teamService.createTeam(team);
    }

    // READ

}
