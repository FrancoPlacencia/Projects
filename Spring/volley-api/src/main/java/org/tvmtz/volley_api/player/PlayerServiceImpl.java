package org.tvmtz.volley_api.player;

import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.tvmtz.volley_api.util.AppUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Slf4j
@Service
public class PlayerServiceImpl implements PlayerService {
    @Autowired
    PlayerRepository playerRepository;

    @Autowired
    ModelMapper modelMapper;

    @Override
    public ResponseEntity<PlayerDTO> createPlayer(PlayerDTO playerDTO) {
        log.info("PlayerDTO {}", playerDTO);
        Player player = modelMapper.map(playerDTO, Player.class);
        if (playerExist(player)) {
            return new ResponseEntity<>(playerDTO, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(modelMapper.map(playerRepository.save(player), PlayerDTO.class), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<PlayerDTO>> getPlayers(String uuid) {
        List<Player> players = playerRepository.findByTeam(uuid).orElse(new ArrayList<>());
        if (players.isEmpty()) {
            return new ResponseEntity<>(new ArrayList<>(), HttpStatus.OK);
        }
        return new ResponseEntity<>(getDTOList(players), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<PlayerDTO> updatePlayer(PlayerDTO playerDTO) {
        Player player = modelMapper.map(playerDTO, Player.class);
        // BAD REQUEST
        if (AppUtil.isUuidNull(player.getPlayerUuid())) {
            return new ResponseEntity<>(playerDTO, HttpStatus.BAD_REQUEST);
        }
        // NOT FOUND
        Player dbPlayer = playerRepository.findById(player.getPlayerUuid()).orElse(null);
        if (dbPlayer == null) {
            return new ResponseEntity<>(playerDTO, HttpStatus.NOT_FOUND);
        }
        // UPDATE
        updatePlayer(player, dbPlayer);
        playerDTO = modelMapper.map(player, PlayerDTO.class);
        return new ResponseEntity<>(playerDTO, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<PlayerDTO> deletePlayer(String uuid) {
        // BAD REQUEST
        if (AppUtil.isNullOrEmptyString(uuid)) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        Player player = Player.builder().playerUuid(UUID.fromString(uuid)).build();
        // NOT FOUND
        Player dbPlayer = playerRepository.findById(player.getPlayerUuid()).orElse(null);
        if (dbPlayer == null) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
        // OK
        playerRepository.delete(dbPlayer);
        return new ResponseEntity<>(null, HttpStatus.OK);

    }


    private List<PlayerDTO> getDTOList(List<Player> players) {
        List<PlayerDTO> playersDTOs = new ArrayList<>();
        for (Player player : players) {
            playersDTOs.add(modelMapper.map(player, PlayerDTO.class));
        }
        return playersDTOs;
    }

    private boolean playerExist(Player player) {
        Player dbPlayer = playerRepository.findByTeamAndNumber(player.getTeam(), player.getNumber()).orElse(null);
        return dbPlayer != null;
    }

    private void updatePlayer(Player request, Player db) {
        if (!request.getName().equals(db.getName())) {
            db.setName(request.getName());
        }
        if (!request.getLastName().equals(db.getLastName())) {
            db.setLastName(request.getLastName());
        }
        if (!Objects.equals(request.getNumber(), db.getNumber())) {
            db.setNumber(request.getNumber());
        }
        playerRepository.save(db);
    }
}
