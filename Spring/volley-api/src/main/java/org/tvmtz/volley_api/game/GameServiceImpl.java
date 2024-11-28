package org.tvmtz.volley_api.game;

import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class GameServiceImpl implements GameService {
    @Autowired
    GameRepository gameRepository;

    @Autowired
    ModelMapper modelMapper;

    @Override
    public ResponseEntity<List<GameDTO>> getGames(String tournamentUuid) {
        List<Game> games = gameRepository.findByTournament(tournamentUuid).orElse(new ArrayList<>());
        log.info("games {}", games);
        if (games.isEmpty()) {
            return new ResponseEntity<>(new ArrayList<>(), HttpStatus.OK);
        }
        List<GameDTO> gamesDTOs = new ArrayList<>();
        for (Game game : games) {
            gamesDTOs.add(modelMapper.map(game, GameDTO.class));
        }
        return new ResponseEntity<>(gamesDTOs, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<WeekOptionDTO>> getWeekOptions(String tournamentUuid) {
        List<Integer> weeks = gameRepository.weeksByTournament(tournamentUuid).orElse(null);
        List<WeekOptionDTO> weekDTOs = new ArrayList<>();
        if (weeks == null) {
            return new ResponseEntity<>(weekDTOs, HttpStatus.NOT_FOUND);
        }
        for (Integer week : weeks) {
            weekDTOs.add(WeekOptionDTO.builder().weekNumber(week).tournamentUuid(tournamentUuid).build());
        }
        return new ResponseEntity<>(weekDTOs, HttpStatus.OK);
    }
}
