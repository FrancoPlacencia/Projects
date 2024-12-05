package org.tvmtz.volley_api.game;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.tvmtz.volley_api.common.CommonResponse;

import java.util.List;

@RestController
@RequestMapping("/api")
public class GameController {

    @Autowired
    GameService gameService;

    // CREATE
    @PostMapping("admin/game")
    public ResponseEntity<CommonResponse> createGame(@RequestBody GameDTO gameDto) {
        return gameService.createGame(gameDto);
    }

    // READ
    @GetMapping("/games")
    public ResponseEntity<List<GameDTO>> getGames(@RequestParam Integer id, @RequestParam Integer weekNumber) {
        return gameService.getGames(id, weekNumber);
    }

    @GetMapping("/gameWeeks")
    public ResponseEntity<List<WeekOptionDTO>> getWeekOptions(@RequestParam Integer id) {
        return gameService.getWeekOptions(id);
    }

    // UPDATE
    @PutMapping("/admin/game")
    public ResponseEntity<CommonResponse> updateGame(@Valid @RequestBody GameDTO gameDto) {
        return gameService.updateGame(gameDto);
    }
}
