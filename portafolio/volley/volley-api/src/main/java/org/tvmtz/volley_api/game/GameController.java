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
    @GetMapping("/gamesByWeek")
    public ResponseEntity<List<GameDTO>> getGames(@RequestParam Integer id, @RequestParam Integer weekNumber) {
        return gameService.getGameWeeks(id, weekNumber);
    }

    @GetMapping("/gamesPlayoff")
    public ResponseEntity<List<GameDTO>> gamesPlayoff(@RequestParam Integer id, @RequestParam String stage) {
        return gameService.gamesPlayoff(id, stage);
    }

    @GetMapping("/games")
    public ResponseEntity<List<GameDTO>> getGames(@RequestParam Integer id) {
        return gameService.getGames(id);
    }

    // UPDATE
    @PutMapping("/admin/game")
    public ResponseEntity<CommonResponse> updateGame(@Valid @RequestBody GameDTO gameDto) {
        return gameService.updateGame(gameDto);
    }

    // DELETE
    @DeleteMapping("/admin/game")
    public ResponseEntity<CommonResponse> deleteGame(@RequestParam Integer id) {
        return gameService.deleteGame(id);
    }

}
