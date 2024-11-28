package org.tvmtz.volley_api.tournament;

import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.tvmtz.volley_api.util.AppUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Slf4j
@Service
public class TournamentServiceImpl implements TournamentService {
    @Autowired
    TournamentRepository tournamentRepository;

    @Autowired
    ModelMapper modelMapper;

    @Override
    public ResponseEntity<TournamentDTO> saveTournament(TournamentDTO tournamentDto) {
        Tournament tournament = modelMapper.map(tournamentDto, Tournament.class);
        // ALREADY EXISTS
        if (tournamentExists(tournament)) {
            return new ResponseEntity<>(tournamentDto, HttpStatus.CONFLICT);
        }
        log.info("Tournament {}", tournament);
        // CREATE
        tournamentRepository.save(tournament);

        tournamentDto = modelMapper.map(tournament, TournamentDTO.class);
        return new ResponseEntity<>(tournamentDto, HttpStatus.CREATED);
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
    public ResponseEntity<TournamentDTO> getTournament(String stringUuid) {
        try {
            UUID uuid = UUID.fromString(stringUuid);
            // NOT FOUND
            Tournament dbTournament = tournamentRepository.findByTournamentUuid(uuid).orElse(null);
            if (dbTournament == null) {
                return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
            }
            return new ResponseEntity<>(modelMapper.map(dbTournament, TournamentDTO.class), HttpStatus.OK);
        } catch (IllegalArgumentException e) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
    }

    /*
        @Override
        public ResponseEntity<TournamentDTO> getTournament(String name, Integer year) {
            if (AppUtil.isNullOrEmptyString(name) || AppUtil.isNullOrZeroOrLess(year)) {
                return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
            }
            Tournament tournamentDb = tournamentRepository.findByNameOrYear(name, year).orElse(null);
            if (tournamentDb == null) {
                return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
            }
            return new ResponseEntity<>(modelMapper.map(tournamentDb, TournamentDTO.class), HttpStatus.OK);
        }
    */
    @Override
    public ResponseEntity<TournamentDTO> updateTournament(TournamentDTO tournamentDto) {
        Tournament tournament = modelMapper.map(tournamentDto, Tournament.class);
        log.info("Tournament {}", tournament);
        // BAD REQUEST
        if (
                tournament.getTournamentUuid() == null ||
                        AppUtil.isNullOrEmptyString(tournament.getTournamentUuid().toString())
        ) {
            return new ResponseEntity<>(tournamentDto, HttpStatus.BAD_REQUEST);
        }

        // NOT FOUND
        Tournament dbTournament = tournamentRepository.findByTournamentUuid(tournament.getTournamentUuid()).orElse(null);
        if (dbTournament == null) {
            return new ResponseEntity<>(tournamentDto, HttpStatus.NOT_FOUND);
        }
        // UPDATE
        updateTournament(tournament, dbTournament);
        tournamentDto = modelMapper.map(tournament, TournamentDTO.class);
        return new ResponseEntity<>(tournamentDto, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<TournamentDTO> deleteTournament(String stringUuid) {
        // BAD REQUEST
        if (
                stringUuid != null &&
                        AppUtil.isNullOrEmptyString(stringUuid)
        ) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        Tournament tournament = new Tournament();
        tournament.setTournamentUuid(UUID.fromString(stringUuid));
        // NOT FOUND
        Tournament dbTournament = tournamentRepository.findByTournamentUuid(tournament.getTournamentUuid()).orElse(null);
        if (dbTournament == null) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
        // OK
        tournamentRepository.delete(tournament);
        return new ResponseEntity<>(null, HttpStatus.OK);
    }

    private boolean tournamentExists(Tournament tournament) {
        Tournament dbTournament = tournamentRepository.findByNameAndYear(tournament.getName(), tournament.getYear()).orElse(null);
        return dbTournament != null;
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
        log.info("DB Tournament {}", db);
        tournamentRepository.save(db);
    }
/*
    private List<String> validateMandatoryFields(Tournament tournament) {
        List<String> mandatoryFields = new ArrayList<>();
        if (AppUtil.isNullOrEmptyString(tournament.getName())) {
            mandatoryFields.add("Missing name");
        }
        if (AppUtil.isNullOrZeroOrLess(tournament.getYear())) {
            mandatoryFields.add("Missing year");
        }
        if (AppUtil.isNullOrEmptyString(tournament.getDescription())) {
            mandatoryFields.add("Missing description");
        }
        /*
        if (AppUtil.isNullOrEmptyString(tournament.getUrl())) {
            mandatoryFields.add("Missing URL");
        }

        return mandatoryFields;
    }
*/
}
