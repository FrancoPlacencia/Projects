package org.tvmtz.volley_api.player;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class PlayerController {

    @Autowired
    PlayerService playerService;

    // CREATE
    @PostMapping("/admin/player")
    public ResponseEntity<PlayerDTO> createPlayer(@Valid @RequestBody PlayerDTO playerDTO) {
        return playerService.createPlayer(playerDTO);
    }

    // READ
    @GetMapping("/players")
    public ResponseEntity<List<PlayerDTO>> getPlayers(@RequestParam String uuid) {
        return playerService.getPlayers(uuid);
    }

    // Update
    @PutMapping("/admin/player")
    public ResponseEntity<PlayerDTO> updatePlayer(@Valid @RequestBody PlayerDTO playerDTO) {
        return playerService.updatePlayer(playerDTO);
    }

    // DELETE
    @DeleteMapping("/admin/player")
    public ResponseEntity<PlayerDTO> deletePlayer(@RequestParam String uuid) {
        return playerService.deletePlayer(uuid);
    }
}
