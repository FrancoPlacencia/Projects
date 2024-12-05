package org.tvmtz.volley_api.tournament;

import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.tvmtz.volley_api.common.CommonResponse;
import org.tvmtz.volley_api.util.AppConstants;
import org.tvmtz.volley_api.util.AppUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Slf4j
@Service
public class TournamentServiceImpl implements TournamentService {
    @Autowired
    TournamentRepository tournamentRepository;

    @Autowired
    ModelMapper modelMapper;

    @Override
    public ResponseEntity<CommonResponse> createTournament(TournamentDTO tournamentDto) {
        CommonResponse commonResponse;
        Tournament tournament = modelMapper.map(tournamentDto, Tournament.class);
        // ALREADY EXISTS
        if (tournamentExists(tournament)) {
            commonResponse = CommonResponse.builder().response(AppConstants.TOURNAMENT + " " + AppConstants.ALREADY_EXISTS).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.CONFLICT);
        }
        // CREATE
        tournamentRepository.save(tournament);
        commonResponse = CommonResponse.builder().response(AppConstants.TOURNAMENT + " " + AppConstants.CREATED).build();
        return new ResponseEntity<>(commonResponse, HttpStatus.CREATED);
    }


    @Override
    public ResponseEntity<List<TournamentDTO>> getTournaments() {
        List<Tournament> tournaments = tournamentRepository.findAll();
        if (tournaments.isEmpty()) {
            return new ResponseEntity<>(new ArrayList<>(), HttpStatus.OK);
        }
        List<TournamentDTO> tournamentDTOS = new ArrayList<>();
        for (Tournament tournament : tournaments) {
            tournamentDTOS.add(modelMapper.map(tournament, TournamentDTO.class));
        }
        return new ResponseEntity<>(tournamentDTOS, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<TournamentDTO> getTournament(Integer tournamentId) {
        // BAD REQUEST
        if (AppUtil.isNullOrZeroOrLess(tournamentId)) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        // NOT FOUND
        Tournament dbTournament = tournamentRepository.findByTournamentId(tournamentId).orElse(null);
        if (dbTournament == null) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(modelMapper.map(dbTournament, TournamentDTO.class), HttpStatus.OK);

    }

    @Override
    public ResponseEntity<CommonResponse> updateTournament(TournamentDTO tournamentDto) {
        CommonResponse commonResponse;
        Tournament tournament = modelMapper.map(tournamentDto, Tournament.class);
        // BAD REQUEST
        if (AppUtil.isNullOrZeroOrLess(tournament.getTournamentId())) {
            commonResponse = CommonResponse.builder().response(AppConstants.TOURNAMENT + " " + AppConstants.MISSING_DATA).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.BAD_REQUEST);
        }
        // ALREADY EXISTS
        if (tournamentExists(tournament)) {
            commonResponse = CommonResponse.builder().response(AppConstants.TOURNAMENT + " " + AppConstants.ALREADY_EXISTS).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.CONFLICT);
        }
        // NOT FOUND
        Tournament dbTournament = tournamentRepository.findByTournamentId(tournament.getTournamentId()).orElse(null);
        if (dbTournament == null) {
            commonResponse = CommonResponse.builder().response(AppConstants.TOURNAMENT + " " + AppConstants.NOT_FOUND).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.NOT_FOUND);
        }
        // UPDATE
        updateTournament(tournament, dbTournament);
        commonResponse = CommonResponse.builder().response(AppConstants.TOURNAMENT + " " + AppConstants.UPDATED).build();
        return new ResponseEntity<>(commonResponse, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CommonResponse> deleteTournament(Integer tournamentId) {
        CommonResponse commonResponse;
        // BAD REQUEST
        if (AppUtil.isNullOrZeroOrLess(tournamentId)) {
            commonResponse = CommonResponse.builder().response(AppConstants.TOURNAMENT + " " + AppConstants.MISSING_DATA).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.BAD_REQUEST);
        }
        // NOT FOUND
        Tournament tournament = tournamentRepository.findByTournamentId(tournamentId).orElse(null);
        if (tournament == null) {
            commonResponse = CommonResponse.builder().response(AppConstants.TOURNAMENT + " " + AppConstants.NOT_FOUND).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.NOT_FOUND);
        }
        // OK
        tournamentRepository.delete(tournament);
        commonResponse = CommonResponse.builder().response(AppConstants.TOURNAMENT + " " + AppConstants.DELETED).build();
        return new ResponseEntity<>(commonResponse, HttpStatus.OK);
    }

    private boolean tournamentExists(Tournament tournament) {
        Tournament dbTournament = tournamentRepository.findByNameAndYear(tournament.getName(), tournament.getYear()).orElse(null);
        if (dbTournament == null) {
            return false;
        }
        return !Objects.equals(tournament.getTournamentId(), dbTournament.getTournamentId());
    }

    /*
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
        if (!request.getRounds().equals(db.getRounds())) {
            db.setRounds(request.getRounds());
        }
        if (!request.getUrl().equals(db.getUrl())) {
            db.setUrl(request.getUrl());
        }
        tournamentRepository.save(db);
    }

}
