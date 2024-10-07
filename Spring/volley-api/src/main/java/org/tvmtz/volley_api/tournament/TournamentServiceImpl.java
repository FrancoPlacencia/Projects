package org.tvmtz.volley_api.tournament;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.tvmtz.volley_api.common.CommonResponseDTO;
import org.tvmtz.volley_api.util.AppConstants;
import org.tvmtz.volley_api.util.AppResponseUtil;
import org.tvmtz.volley_api.util.AppUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Slf4j
@Service
public class TournamentServiceImpl implements TournamentService {
    @Autowired
    TournamentRepository tournamentRepository;

    @Override
    public ResponseEntity<CommonResponseDTO> createTournament(Tournament tournament) {
        // REQUIRED
        if (
                AppUtil.isNullOrEmptyString(tournament.getName()) ||
                        AppUtil.isNullOrZeroOrLess(tournament.getYear()) ||
                        AppUtil.isNullOrEmptyString(tournament.getDescription()) ||
                        AppUtil.isNullOrEmptyString(tournament.getUrl())
        ) {
            return new ResponseEntity<>(AppResponseUtil.dataMissingResponse(), HttpStatus.BAD_REQUEST);
        }

        // VALIDATE
        if (tournament.getName().length() > 50) {
            return new ResponseEntity<>(AppResponseUtil.getLengthErrorResponse(AppConstants.TOURNAMENT), HttpStatus.BAD_REQUEST);
        }

        // ALREADY EXISTS
        if (tournamentExists(tournament)) {
            return new ResponseEntity<>(AppResponseUtil.alreadyExistsResponse(AppConstants.TOURNAMENT), HttpStatus.CONFLICT);
        }

        // CREATE
        tournamentRepository.save(tournament);
        return new ResponseEntity<>(AppResponseUtil.successResponse(AppConstants.TOURNAMENT, AppConstants.CREATED), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CommonResponseDTO> getTournaments() {
        List<Tournament> tournaments = tournamentRepository.findAll();
        if (tournaments.isEmpty()) {
            return new ResponseEntity<>(AppResponseUtil.notFoundResponse(AppConstants.TOURNAMENT), HttpStatus.NOT_FOUND);
        }
        CommonResponseDTO commonResponseDTO = AppResponseUtil.successResponse(AppConstants.TOURNAMENT, AppConstants.READ);
        commonResponseDTO.setMessage(tournaments);
        return new ResponseEntity<>(commonResponseDTO, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CommonResponseDTO> getTournament(Map<String, String> request) {
        log.info("id ({}) = {}", request.containsKey("id"), request.get("id"));
        log.info("name ({}) = {}", request.containsKey("name"), request.get("name"));
        log.info("year ({}) = {}", request.containsKey("year"), request.get("year"));
        if (request.containsKey("id")) {
            return getTournamentById(Integer.valueOf(request.get("id")));
        }

        if (request.containsKey("name") && !request.containsKey("year")) {
            return getTournamentByName(request.get("name"));
        }

        if (!request.containsKey("name") && request.containsKey("year")) {
            return getTournamentByYear(Integer.valueOf(request.get("year")));
        }

        if (request.containsKey("name") && request.containsKey("year")) {
            return getTournamentByNameAndYear(request.get("name"), Integer.valueOf(request.get("year")));
        }

        return new ResponseEntity<>(AppResponseUtil.badRequest(AppConstants.TOURNAMENT), HttpStatus.BAD_REQUEST);

    }

    @Override
    public ResponseEntity<CommonResponseDTO> updateTournament(Tournament tournament) {
        // BAD REQUEST
        if (AppUtil.isNullOrZeroOrLess(tournament.getTournamentId())) {
            return new ResponseEntity<>(AppResponseUtil.dataMissingResponse(), HttpStatus.BAD_REQUEST);
        }
        // NOT FOUND
        Tournament dbTournament = tournamentRepository.findById(tournament.getTournamentId()).orElse(null);
        if (dbTournament == null) {
            return new ResponseEntity<>(AppResponseUtil.notFoundResponse(AppConstants.TOURNAMENT), HttpStatus.NOT_FOUND);
        }
        // UPDATE
        updateTournament(tournament, dbTournament);
        return new ResponseEntity<>(AppResponseUtil.successResponse(AppConstants.TOURNAMENT, AppConstants.UPDATED), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CommonResponseDTO> deleteTournament(Tournament tournament) {
        // BAD REQUEST
        if (AppUtil.isNullOrZeroOrLess(tournament.getTournamentId())) {
            return new ResponseEntity<>(AppResponseUtil.dataMissingResponse(), HttpStatus.BAD_REQUEST);
        }
        // NOT FOUND
        Tournament dbTournament = tournamentRepository.findById(tournament.getTournamentId()).orElse(null);
        if (dbTournament == null) {
            return new ResponseEntity<>(AppResponseUtil.notFoundResponse(AppConstants.TOURNAMENT), HttpStatus.NOT_FOUND);
        }
        // OK
        tournamentRepository.delete(tournament);
        return new ResponseEntity<>(AppResponseUtil.successResponse(AppConstants.TOURNAMENT, AppConstants.DELETED), HttpStatus.OK);
    }


    private ResponseEntity<CommonResponseDTO> getTournamentById(Integer id) {
        log.info("getTournament " + id);
        // BAD REQUEST
        if (AppUtil.isNullOrZeroOrLess(id)) {
            return new ResponseEntity<>(AppResponseUtil.dataMissingResponse(), HttpStatus.BAD_REQUEST);
        }
        // NOT FOUND
        Tournament dbTournament = tournamentRepository.findById(id).orElse(null);
        if (dbTournament == null) {
            return new ResponseEntity<>(AppResponseUtil.notFoundResponse(AppConstants.TOURNAMENT), HttpStatus.NOT_FOUND);
        }

        List<Tournament> tournaments = new ArrayList<>();
        tournaments.add(dbTournament);
        CommonResponseDTO commonResponseDTO = AppResponseUtil.successResponse(AppConstants.TOURNAMENT, AppConstants.READ);
        commonResponseDTO.setMessage(tournaments);
        return new ResponseEntity<>(commonResponseDTO, HttpStatus.OK);
    }


    private ResponseEntity<CommonResponseDTO> getTournamentByName(String name) {
        if (AppUtil.isNullOrEmptyString(name)) {
            return new ResponseEntity<>(AppResponseUtil.dataMissingResponse(), HttpStatus.BAD_REQUEST);
        }
        List<Tournament> tournaments = tournamentRepository.findByName(name);
        if (tournaments.isEmpty()) {
            return new ResponseEntity<>(AppResponseUtil.notFoundResponse(AppConstants.TOURNAMENT), HttpStatus.NOT_FOUND);
        }
        CommonResponseDTO commonResponseDTO = AppResponseUtil.successResponse(AppConstants.TOURNAMENT, AppConstants.READ);
        commonResponseDTO.setMessage(tournaments);
        return new ResponseEntity<>(commonResponseDTO, HttpStatus.OK);
    }

    private ResponseEntity<CommonResponseDTO> getTournamentByYear(Integer year) {
        if (AppUtil.isNullOrZeroOrLess(year)) {
            return new ResponseEntity<>(AppResponseUtil.dataMissingResponse(), HttpStatus.BAD_REQUEST);
        }
        List<Tournament> tournaments = tournamentRepository.findByYear(year);
        if (tournaments.isEmpty()) {
            return new ResponseEntity<>(AppResponseUtil.notFoundResponse(AppConstants.TOURNAMENT), HttpStatus.NOT_FOUND);
        }
        CommonResponseDTO commonResponseDTO = AppResponseUtil.successResponse(AppConstants.TOURNAMENT, AppConstants.READ);
        commonResponseDTO.setMessage(tournaments);
        return new ResponseEntity<>(commonResponseDTO, HttpStatus.OK);
    }

    private ResponseEntity<CommonResponseDTO> getTournamentByNameAndYear(String name, Integer year) {
        if (
                AppUtil.isNullOrEmptyString(name) ||
                        AppUtil.isNullOrZeroOrLess(year)
        ) {
            return new ResponseEntity<>(AppResponseUtil.dataMissingResponse(), HttpStatus.BAD_REQUEST);
        }
        List<Tournament> tournaments = tournamentRepository.findByNameAndYear(name, year);
        if (tournaments.isEmpty()) {
            return new ResponseEntity<>(AppResponseUtil.notFoundResponse(AppConstants.TOURNAMENT), HttpStatus.NOT_FOUND);
        }
        CommonResponseDTO commonResponseDTO = AppResponseUtil.successResponse(AppConstants.TOURNAMENT, AppConstants.READ);
        commonResponseDTO.setMessage(tournaments);
        return new ResponseEntity<>(commonResponseDTO, HttpStatus.OK);
    }

    private boolean tournamentExists(Tournament tournament) {
        Tournament dbTournament = tournamentRepository.findUnique(tournament.getName(), tournament.getYear()).orElse(null);
        return dbTournament != null;
    }

    /**
     * Update the DB entity with the Request data
     *
     * @param request
     * @param db
     */
    private void updateTournament(Tournament request, Tournament db) {
        if (!request.getName().equals(db.getName())) {
            db.setName(request.getName());
        }
        if (!Objects.equals(request.getYear(), db.getYear())) {
            db.setYear(request.getYear());
        }
        if (!request.getDescription().equals(db.getDescription())) {
            db.setDescription(request.getDescription());
        }
        if (request.getUrl().equals(db.getUrl())) {
            db.setUrl(request.getUrl());
        }
        tournamentRepository.save(db);
    }
}
