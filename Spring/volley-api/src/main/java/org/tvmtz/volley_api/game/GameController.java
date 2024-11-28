package org.tvmtz.volley_api.game;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class GameController {

    @Autowired
    GameService gameService;

    // READ
    @GetMapping("/games")
    public ResponseEntity<List<GameDTO>> getGames(@RequestParam String uuid) {
        return gameService.getGames(uuid);
    }

    @GetMapping("/weekOptions")
    public ResponseEntity<List<WeekOptionDTO>> getWeekOptions(@RequestParam String uuid) {
        return gameService.getWeekOptions(uuid);
    }
}
