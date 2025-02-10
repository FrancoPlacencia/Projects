package org.tvmtz.volley_api.player;

import org.springframework.http.ResponseEntity;
import org.tvmtz.volley_api.common.CommonResponse;

import java.util.List;

public interface PlayerService {

    ResponseEntity<CommonResponse> createPlayer(PlayerDTO playerDTO);

    ResponseEntity<List<PlayerDTO>> getPlayers(Integer playerId);

    ResponseEntity<CommonResponse> updatePlayer(PlayerDTO playerDTO);

    ResponseEntity<CommonResponse> deletePlayer(Integer playerId);

    List<PlayerOptionsDTO> getPlayersOptions(Integer teamId, Integer gameId, String stage);
}
