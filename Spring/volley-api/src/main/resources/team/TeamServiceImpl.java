package team;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.tvmtz.volley_api.tournament.TournamentService;
import org.tvmtz.volley_api.util.AppConstants;
import org.tvmtz.volley_api.util.AppResponseUtil;
import org.tvmtz.volley_api.util.AppUtil;

import java.util.Map;

@Slf4j
@Service
public class TeamServiceImpl implements TeamService {

    @Autowired
    TeamRepository teamRepository;

    @Autowired
    TournamentService tournamentService;

    @Override
    public ResponseEntity<CommonResponseDTO> createTeam(Team team) {
        log.info("team {}", team.toString());
        // REQUIRED Tournament
        if (AppUtil.isNullOrEmptyString(team.getTournament().getUuid().toString())) {
            return new ResponseEntity<>(AppResponseUtil.dataMissingResponse(null), HttpStatus.BAD_REQUEST);
        }


        // REQUIRED Team
        if (
                AppUtil.isNullOrZeroOrLess(team.getNumber()) ||
                        AppUtil.isNullOrEmptyString(team.getName()) ||
                        AppUtil.isNullOrEmptyString(team.getCategory().toString())
        ) {
            return new ResponseEntity<>(AppResponseUtil.dataMissingResponse(null), HttpStatus.BAD_REQUEST);
        }

        // VALIDATE
        if (team.getName().length() > 20) {
            return new ResponseEntity<>(AppResponseUtil.getLengthErrorResponse(AppConstants.TEAM, null), HttpStatus.BAD_REQUEST);
        }

        // ALREADY EXISTS
        if (teamExists(team)) {
            return new ResponseEntity<>(AppResponseUtil.alreadyExistsResponse(AppConstants.TEAM), HttpStatus.CONFLICT);
        }


        // CREATE
        teamRepository.save(team);
        return new ResponseEntity<>(AppResponseUtil.successResponse(AppConstants.TEAM, AppConstants.CREATED), HttpStatus.OK);

    }

    @Override
    public ResponseEntity<CommonResponseDTO> getTeams() {
        return null;
    }

    @Override
    public ResponseEntity<CommonResponseDTO> getTeam(Map<String, String> request) {
        return null;
    }

    @Override
    public ResponseEntity<CommonResponseDTO> updateTeam(Team Team) {
        return null;
    }

    @Override
    public ResponseEntity<CommonResponseDTO> deleteTeam(Team Team) {
        return null;
    }

    private boolean teamExists(Team team) {
        Team dbTeam = null;
        //teamRepository.findUnique(team.getTournament().getUuid().toString(), team.getName(), team.getNumber()).orElse(null);
        return dbTeam != null;
    }

}
