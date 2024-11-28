package org.tvmtz.volley_api.player;

import org.springframework.http.ResponseEntity;

import java.util.List;

public interface PlayerService {

    ResponseEntity<PlayerDTO> createPlayer(PlayerDTO playerDTO);

    ResponseEntity<List<PlayerDTO>> getPlayers(String uuid);

    ResponseEntity<PlayerDTO> updatePlayer(PlayerDTO playerDTO);

    ResponseEntity<PlayerDTO> deletePlayer(String uuid);
}
