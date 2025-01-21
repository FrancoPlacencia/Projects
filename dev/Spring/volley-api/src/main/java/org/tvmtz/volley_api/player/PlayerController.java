package org.tvmtz.volley_api.player;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.tvmtz.volley_api.common.CommonResponse;

import java.util.List;

@RestController
@RequestMapping("/api")
public class PlayerController {

    @Autowired
    PlayerService playerService;

    // CREATE
    @PostMapping("/admin/player")
    public ResponseEntity<CommonResponse> createPlayer(@Valid @RequestBody PlayerDTO playerDTO) {
        return playerService.createPlayer(playerDTO);
    }

    // READ
    @GetMapping("/players")
    public ResponseEntity<List<PlayerDTO>> getPlayers(@RequestParam Integer id) {
        return playerService.getPlayers(id);
    }

    // Update
    @PutMapping("/admin/player")
    public ResponseEntity<CommonResponse> updatePlayer(@Valid @RequestBody PlayerDTO playerDTO) {
        return playerService.updatePlayer(playerDTO);
    }

    // DELETE
    @DeleteMapping("/admin/player")
    public ResponseEntity<CommonResponse> deletePlayer(@RequestParam Integer id) {
        return playerService.deletePlayer(id);
    }
}
