package org.tvmtz.volley_api.game;


import org.springframework.http.ResponseEntity;
import org.tvmtz.volley_api.common.CommonResponse;

import java.util.List;

public interface GameService {

    ResponseEntity<CommonResponse> createGame(GameDTO gameDto);

    ResponseEntity<List<GameDTO>> getGames(Integer tournamentId, Integer weekNumber);

    ResponseEntity<List<WeekOptionDTO>> getWeekOptions(Integer tournamentId);

    ResponseEntity<CommonResponse> updateGame(GameDTO gameDto);
}
