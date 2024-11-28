package org.tvmtz.volley_api.team;

import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.tvmtz.volley_api.tournament.TournamentService;
import org.tvmtz.volley_api.util.AppUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Slf4j
@Service
public class TeamServiceImpl implements TeamService {

    @Autowired
    TeamRepository teamRepository;

    @Autowired
    TournamentService tournamentService;

    @Autowired
    ModelMapper modelMapper;

    @Override
    public ResponseEntity<TeamDTO> createTeam(TeamDTO teamDto) {
        Team team = modelMapper.map(teamDto, Team.class);
        log.info("TeamDTO {}", teamDto);
        log.info("Team {}", team);
        // ALREADY EXISTS
        if (teamExists(team)) {
            return new ResponseEntity<>(teamDto, HttpStatus.BAD_REQUEST);
        }

        // CREATE
        teamRepository.save(team);
        teamDto = modelMapper.map(team, TeamDTO.class);
        return new ResponseEntity<>(teamDto, HttpStatus.OK);

    }


    @Override
    public ResponseEntity<List<TeamDTO>> getTeams(String tournamentUuid, String category) {
        List<Team> teams = teamRepository.findByTournamentAndCategory(tournamentUuid, category).orElse(new ArrayList<>());
        log.info("teams {}", teams);
        if (teams.isEmpty()) {
            return new ResponseEntity<>(new ArrayList<>(), HttpStatus.OK);
        }
        List<TeamDTO> teamDTOS = new ArrayList<>();
        for (Team team : teams) {
            teamDTOS.add(modelMapper.map(team, TeamDTO.class));
        }
        return new ResponseEntity<>(teamDTOS, HttpStatus.OK);
    }


    @Override
    public ResponseEntity<TeamDTO> getTeam(String teamUuid) {
        UUID uuid = UUID.fromString(teamUuid);
        Team team = teamRepository.findById(uuid).orElse(null);
        if (team == null) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
        TeamDTO teamDto = modelMapper.map(team, TeamDTO.class);
        return new ResponseEntity<>(teamDto, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<TeamDTO> updateTeam(TeamDTO teamDto) {
        Team team = modelMapper.map(teamDto, Team.class);
        // BAD REQUEST
        if (team.getTeamUuid() == null || AppUtil.isNullOrEmptyString(team.getTeamUuid().toString())) {
            return new ResponseEntity<>(teamDto, HttpStatus.BAD_REQUEST);
        }

        // NOT FOUND
        Team dbTeam = teamRepository.findById(team.getTeamUuid()).orElse(null);
        if (dbTeam == null) {
            return new ResponseEntity<>(teamDto, HttpStatus.NOT_FOUND);
        }

        // UPDATE
        updateTeam(team, dbTeam);
        teamDto = modelMapper.map(team, TeamDTO.class);
        return new ResponseEntity<>(teamDto, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<TeamDTO> deleteTeam(String stringUuid) {
        // BAD REQUEST
        if (
                stringUuid != null &&
                        AppUtil.isNullOrEmptyString(stringUuid)
        ) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        Team team = new Team();
        team.setTeamUuid(UUID.fromString(stringUuid));
        // NOT FOUND
        Team dbTeam = teamRepository.findById(team.getTeamUuid()).orElse(null);
        if (dbTeam == null) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
        // OK
        teamRepository.delete(dbTeam);
        return new ResponseEntity<>(null, HttpStatus.OK);
    }

    private boolean teamExists(Team team) {
        Team dbTeam = null;
        //teamRepository.findUnique(team.getTournament().getUuid().toString(), team.getName(), team.getNumber()).orElse(null);
        return false;
    }

    private void updateTeam(Team request, Team db) {
        if (!request.getName().equals(db.getName())) {
            db.setName(request.getName());
        }
        if (!Objects.equals(request.getInitials(), db.getInitials())) {
            db.setInitials(request.getInitials());
        }
        log.info("DB Tournament {}", db);
        teamRepository.save(db);
    }

}
