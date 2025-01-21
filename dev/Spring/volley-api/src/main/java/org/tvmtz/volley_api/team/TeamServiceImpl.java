package org.tvmtz.volley_api.team;

import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.tvmtz.volley_api.common.CommonResponse;
import org.tvmtz.volley_api.player.PlayerRepository;
import org.tvmtz.volley_api.tournament.TournamentService;
import org.tvmtz.volley_api.util.AppConstants;
import org.tvmtz.volley_api.util.AppUtil;

import java.util.*;

@Slf4j
@Service
public class TeamServiceImpl implements TeamService {

    @Autowired
    TeamRepository teamRepository;

    @Autowired
    PlayerRepository playerRepository;

    @Autowired
    TournamentService tournamentService;

    @Autowired
    ModelMapper modelMapper;

    @Override
    public ResponseEntity<CommonResponse> createTeam(TeamDTO teamDto) {
        CommonResponse commonResponse;
        Team team = modelMapper.map(teamDto, Team.class);
        // ALREADY EXISTS
        if (teamExists(team)) {
            commonResponse = CommonResponse.builder().response(AppConstants.TEAM + " " + AppConstants.ALREADY_EXISTS).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.BAD_REQUEST);
        }
        // CREATE
        teamRepository.save(team);
        commonResponse = CommonResponse.builder().response(AppConstants.TEAM + " " + AppConstants.CREATED).build();
        return new ResponseEntity<>(commonResponse, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<StandingDTO>> getStandings(Integer id, String category) {
        List<Standing> standings = teamRepository.getStandings(id, category).orElse(new ArrayList<>());
        List<StandingDTO> standingDTOS = new ArrayList<>();
        for (Standing standing : standings) {
            standingDTOS.add(modelMapper.map(standing, StandingDTO.class));
        }
        return new ResponseEntity<>(standingDTOS, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<Map<String, List<StandingDTO>>> getStandings(Integer id) {
        Map<String, List<StandingDTO>> standingsMap = new HashMap<>();
        List<String> categories = new ArrayList<>();
        categories.add("FEMENIL");
        categories.add("VARONIL");
        categories.add("MIXTO");
        for (String category : categories) {
            List<Standing> standings = teamRepository.getStandings(id, category).orElse(new ArrayList<>());
            List<StandingDTO> standingDTOS = new ArrayList<>();
            for (Standing standing : standings) {
                standingDTOS.add(modelMapper.map(standing, StandingDTO.class));
            }
            standingsMap.put(category, standingDTOS);
        }
        return new ResponseEntity<>(standingsMap, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<TeamDTO>> getTeams(Integer tournamentId, String category) {
        List<Team> teams;
        if (AppUtil.isNullOrEmptyString(category)) {
            teams = teamRepository.findByTournament(tournamentId).orElse(new ArrayList<>());
        } else {
            teams = teamRepository.findByTournamentAndCategory(tournamentId, category).orElse(new ArrayList<>());
        }
        if (teams.isEmpty()) {
            return new ResponseEntity<>(new ArrayList<>(), HttpStatus.OK);
        }
        List<TeamDTO> teamDTOS = new ArrayList<>();
        for (Team team : teams) {
            teamDTOS.add(TeamDTO.builder()
                    .teamId(team.getTeamId())
                    .teamNumber(team.getTeamNumber())
                    .name(team.getName())
                    .initials(team.getInitials())
                    .category(team.getCategory())
                    .isActive(team.getIsActive())
                    .tournamentId(team.getTournament().getTournamentId())
                    .gamesWon(team.getGamesWon())
                    .gamesLost(team.getGamesLost())
                    .setsWon(team.getSetsWon())
                    .setsLost(team.getSetsLost())
                    .pointsWon(team.getPointsWon())
                    .pointsLost(team.getPointsLost())
                    .players(playerRepository.findByTeam(team.getTeamId()).orElse(new ArrayList<>()))
                    .build());
        }
        return new ResponseEntity<>(teamDTOS, HttpStatus.OK);
    }


    @Override
    public ResponseEntity<TeamDTO> getTeam(Integer teamId) {
        Team team = teamRepository.findById(teamId).orElse(null);
        if (team == null) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
        TeamDTO teamDto = modelMapper.map(team, TeamDTO.class);
        return new ResponseEntity<>(teamDto, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CommonResponse> updateTeam(TeamDTO teamDto) {
        CommonResponse commonResponse;
        Team team = modelMapper.map(teamDto, Team.class);
        // BAD REQUEST
        if (AppUtil.isNullOrZeroOrLess(team.getTeamId())) {
            commonResponse = CommonResponse.builder().response(AppConstants.TEAM + " " + AppConstants.MISSING_DATA).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.BAD_REQUEST);
        }
        // ALREADY EXISTS
        if (teamExists(team)) {
            commonResponse = CommonResponse.builder().response(AppConstants.TEAM + " " + AppConstants.ALREADY_EXISTS).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.CONFLICT);
        }
        // NOT FOUND
        Team dbTeam = teamRepository.findById(team.getTeamId()).orElse(null);
        if (dbTeam == null) {
            commonResponse = CommonResponse.builder().response(AppConstants.TEAM + " " + AppConstants.NOT_FOUND).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.NOT_FOUND);
        }
        // UPDATE
        updateTeam(team, dbTeam);
        commonResponse = CommonResponse.builder().response(AppConstants.TEAM + " " + AppConstants.UPDATED).build();
        return new ResponseEntity<>(commonResponse, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CommonResponse> deleteTeam(Integer teamId) {
        CommonResponse commonResponse;
        // BAD REQUEST
        if (AppUtil.isNullOrZeroOrLess(teamId)) {
            commonResponse = CommonResponse.builder().response(AppConstants.TEAM + " " + AppConstants.MISSING_DATA).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.BAD_REQUEST);
        }
        // NOT FOUND
        Team team = teamRepository.findById(teamId).orElse(null);
        if (team == null) {
            commonResponse = CommonResponse.builder().response(AppConstants.TEAM + " " + AppConstants.NOT_FOUND).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.NOT_FOUND);
        }
        // OK
        teamRepository.delete(team);
        commonResponse = CommonResponse.builder().response(AppConstants.TEAM + " " + AppConstants.DELETED).build();
        return new ResponseEntity<>(commonResponse, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<Map<String, List<TeamOptionsDTO>>> getTeamOptions(Integer tournamentId) {
        List<Team> teams = teamRepository.findByTournament(tournamentId).orElse(new ArrayList<>());
        if (teams.isEmpty()) {
            return new ResponseEntity<>(new HashMap<>(), HttpStatus.OK);
        }
        Map<String, List<TeamOptionsDTO>> teamOptions = new HashMap<>();
        for (Team team : teams) {
            TeamOptionsDTO teamOptionsDTO = TeamOptionsDTO.builder()
                    .teamId(team.getTeamId())
                    .name(team.getName())
                    .category(team.getCategory())
                    .build();
            if (teamOptions.containsKey(team.getCategory())) {
                teamOptions.get(team.getCategory()).add(teamOptionsDTO);
            } else {
                List<TeamOptionsDTO> teamDTOS = new ArrayList<>();
                teamDTOS.add(teamOptionsDTO);
                teamOptions.put(team.getCategory(), teamDTOS);
            }
        }
        return new ResponseEntity<>(teamOptions, HttpStatus.OK);
    }

    private boolean teamExists(Team team) {
        Team dbTeam = teamRepository.findUnique(team.getTournament().getTournamentId(), team.getName(), team.getCategory()).orElse(null);
        if (dbTeam == null) {
            return false;
        }
        return !Objects.equals(team.getTeamId(), dbTeam.getTeamId());
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
