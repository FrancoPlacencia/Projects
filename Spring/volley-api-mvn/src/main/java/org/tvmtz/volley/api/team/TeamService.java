package org.tvmtz.volley.api.team;

import java.util.List;
import org.springframework.http.ResponseEntity;

public interface TeamService {

    ResponseEntity<List<Team>> getAllTeams();
}
