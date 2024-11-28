package org.tvmtz.volley_api.game;


import org.springframework.http.ResponseEntity;

import java.util.List;

public interface GameService {

    ResponseEntity<List<GameDTO>> getGames(String tournamentUuid);

    ResponseEntity<List<WeekOptionDTO>> getWeekOptions(String tournamentUuid);
}
