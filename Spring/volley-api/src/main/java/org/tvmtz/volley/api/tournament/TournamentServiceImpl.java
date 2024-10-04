package org.tvmtz.volley.api.tournament;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.tvmtz.volley.api.util.CommonResponseDTO;
import org.tvmtz.volley.api.util.VolleyConstants;
import org.tvmtz.volley.api.util.VolleyResponseUtil;
import org.tvmtz.volley.api.util.VolleyUtil;

import java.util.List;
import java.util.Objects;

@Slf4j
@Service
public class TournamentServiceImpl implements TournamentService{
    @Autowired
    TournamentRepository tournamentRepository;

    @Override
    public ResponseEntity<List<Tournament>> getTournaments() {
        return new ResponseEntity<>(tournamentRepository.findAll(), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<Tournament> getTournamentById(Integer id) {
        log.info("id=" + id);
        if(VolleyUtil.isNullOrZeroOrLess(id)){
            return new ResponseEntity<>(null,HttpStatus.BAD_REQUEST);
        }
        Tournament dbTournament = tournamentRepository.findById(id).orElse(null);
        if(dbTournament == null) {
            VolleyResponseUtil.getNotFoundResponse(VolleyConstants.TOURNAMENT);
        }
        return new ResponseEntity<>(dbTournament, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<Tournament> getTournamentByName(String name) {
        log.info("name=" + name);
        if(VolleyUtil.isNullOrEmptyString(name)){
            return new ResponseEntity<>(null,HttpStatus.BAD_REQUEST);
        }
        Tournament dbTournament = tournamentRepository.findByName(name).orElse(null);
        if(dbTournament == null) {
            VolleyResponseUtil.getNotFoundResponse(VolleyConstants.TOURNAMENT);
        }
        return new ResponseEntity<>(dbTournament, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CommonResponseDTO> createTournament(Tournament tournament) {
        // Mandatory fields
        if(
                VolleyUtil.isNullOrEmptyString(tournament.getName()) ||
                VolleyUtil.isNullOrZeroOrLess(tournament.getYear()) ||
                VolleyUtil.isNullOrEmptyString(tournament.getDescription()) ||
                VolleyUtil.isNullOrEmptyString(tournament.getUrl())
        ) {
            return VolleyResponseUtil.getDataMissingResponse();
        }

        // Length fields
        if(tournament.getName().length() > 50){
            return VolleyResponseUtil.getLengthErrorResponse(VolleyConstants.TOURNAMENT);
        }

        if(tournamentExists(tournament)) {
            return VolleyResponseUtil.getAlreadyExistsResponse(VolleyConstants.TOURNAMENT);
        }

        tournamentRepository.save(tournament);

        return VolleyResponseUtil.getSuccessResponse(VolleyConstants.TOURNAMENT, VolleyConstants.CREATED);
    }

    @Override
    public ResponseEntity<CommonResponseDTO> uptateTournament(Tournament tournament) {
        if(VolleyUtil.isNullOrZeroOrLess(tournament.getTournamentId())) {
            return VolleyResponseUtil.getDataMissingResponse();
        }
        Tournament dbTournament = tournamentRepository.findById(tournament.getTournamentId()).orElse(null);
        if(dbTournament == null) {
            return VolleyResponseUtil.getNotFoundResponse(VolleyConstants.TOURNAMENT);
        }
        updateTournament(tournament, dbTournament);
        return VolleyResponseUtil.getSuccessResponse(VolleyConstants.TOURNAMENT, VolleyConstants.UPDATED);
    }

    @Override
    public ResponseEntity<CommonResponseDTO> deleteTournament(Tournament tournament) {
        if(VolleyUtil.isNullOrZeroOrLess(tournament.getTournamentId())) {
            return VolleyResponseUtil.getDataMissingResponse();
        }
        Tournament dbTournament = tournamentRepository.findById(tournament.getTournamentId()).orElse(null);
        if(dbTournament == null) {
            return VolleyResponseUtil.getNotFoundResponse(VolleyConstants.TOURNAMENT);
        }
        tournamentRepository.delete(tournament);
        return VolleyResponseUtil.getSuccessResponse(VolleyConstants.TOURNAMENT, VolleyConstants.DELETED);
    }


    private boolean tournamentExists(Tournament tournament) {
        Tournament dbTournament = tournamentRepository.findUnique(tournament.getName(), tournament.getYear()).orElse(null);
        return dbTournament != null;
    }

    /**
     * Update the DB entity with the Request data
     * @param request
     * @param db
     */
    private void updateTournament(Tournament request, Tournament db) {
        if(!request.getName().equals(db.getName())) {
            db.setName(request.getName());
        }
        if(!Objects.equals(request.getYear(), db.getYear())) {
            db.setYear(request.getYear());
        }
        if(!request.getDescription().equals(db.getDescription())){
            db.setDescription(request.getDescription());
        }
        if(request.getUrl().equals(db.getUrl())) {
            db.setUrl(request.getUrl());
        }
        tournamentRepository.save(db);
    }
}
