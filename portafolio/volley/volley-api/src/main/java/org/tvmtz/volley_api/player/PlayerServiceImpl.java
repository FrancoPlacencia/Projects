package org.tvmtz.volley_api.player;

import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.tvmtz.volley_api.common.CommonResponse;
import org.tvmtz.volley_api.team.TeamRepository;
import org.tvmtz.volley_api.util.AppConstants;
import org.tvmtz.volley_api.util.AppUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Slf4j
@Service
public class PlayerServiceImpl implements PlayerService {
    @Autowired
    PlayerRepository playerRepository;

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    TeamRepository teamRepository;

    @Override
    public ResponseEntity<CommonResponse> createPlayer(PlayerDTO playerDTO) {
        log.info("PlayerDTO {}", playerDTO);
        CommonResponse commonResponse;
        if (AppUtil.isNullOrZeroOrLess(playerDTO.getTeamId())) {
            commonResponse = CommonResponse.builder().response(AppConstants.PLAYER + " " + AppConstants.MISSING_DATA).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.BAD_REQUEST);
        }
        Player player = modelMapper.map(playerDTO, Player.class);
        player.setTeam(teamRepository.findById(playerDTO.getTeamId()).orElse(null));
        log.info("Player {}", player);
        log.info("Team {}", player.getTeam());
        if (player.getTeam() == null) {
            commonResponse = CommonResponse.builder().response(AppConstants.PLAYER + " " + AppConstants.MISSING_DATA).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.BAD_REQUEST);
        }
        if (playerExist(player)) {
            commonResponse = CommonResponse.builder().response(AppConstants.PLAYER + " " + AppConstants.ALREADY_EXISTS).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.CONFLICT);
        }
        playerRepository.save(player);
        commonResponse = CommonResponse.builder().response(AppConstants.PLAYER + " " + AppConstants.CREATED).build();
        return new ResponseEntity<>(commonResponse, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<PlayerDTO>> getPlayers(Integer teamId) {
        List<Player> players = playerRepository.findByTeam(teamId).orElse(new ArrayList<>());
        if (players.isEmpty()) {
            return new ResponseEntity<>(new ArrayList<>(), HttpStatus.OK);
        }
        return new ResponseEntity<>(getDTOList(players), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CommonResponse> updatePlayer(PlayerDTO playerDTO) {
        Player player = modelMapper.map(playerDTO, Player.class);
        CommonResponse commonResponse;
        // BAD REQUEST
        if (AppUtil.isNullOrZeroOrLess(player.getPlayerId())) {
            commonResponse = CommonResponse.builder().response(AppConstants.PLAYER + " " + AppConstants.MISSING_DATA).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.BAD_REQUEST);
        }
        // ALREADY EXIST
        if (playerExist(player)) {
            commonResponse = CommonResponse.builder().response(AppConstants.PLAYER + " " + AppConstants.ALREADY_EXISTS).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.CONFLICT);
        }
        // NOT FOUND
        Player dbPlayer = playerRepository.findById(player.getPlayerId()).orElse(null);
        if (dbPlayer == null) {
            commonResponse = CommonResponse.builder().response(AppConstants.PLAYER + " " + AppConstants.NOT_FOUND).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.NOT_FOUND);
        }
        // UPDATE
        updatePlayer(player, dbPlayer);
        commonResponse = CommonResponse.builder().response(AppConstants.PLAYER + " " + AppConstants.UPDATED).build();
        return new ResponseEntity<>(commonResponse, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CommonResponse> deletePlayer(Integer playerId) {
        CommonResponse commonResponse;
        // BAD REQUEST
        if (AppUtil.isNullOrZeroOrLess(playerId)) {
            commonResponse = CommonResponse.builder().response(AppConstants.PLAYER + " " + AppConstants.MISSING_DATA).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.BAD_REQUEST);
        }
        // NOT FOUND
        Player player = playerRepository.findById(playerId).orElse(null);
        if (player == null) {
            commonResponse = CommonResponse.builder().response(AppConstants.PLAYER + " " + AppConstants.NOT_FOUND).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.NOT_FOUND);
        }
        // OK
        playerRepository.delete(player);
        commonResponse = CommonResponse.builder().response(AppConstants.PLAYER + " " + AppConstants.DELETED).build();
        return new ResponseEntity<>(commonResponse, HttpStatus.OK);
    }

    @Override
    public List<PlayerOptionsDTO> getPlayersOptions(Integer teamId, Integer gameId, String stage) {
        List<Player> players = playerRepository.findByTeam(teamId).orElse(new ArrayList<>());
        List<Player> gamePlayers = playerRepository.findByTeamGame(teamId, gameId).orElse(new ArrayList<>());
        List<PlayerOptionsDTO> playerOptionsDTOS = new ArrayList<>();
        for (Player player : players) {
            player.setGamePlayed(gamePlayers.contains(player));
            playerOptionsDTOS.add(
                    PlayerOptionsDTO.builder()
                            .playerId(player.getPlayerId())
                            .number(player.getNumber())
                            .name(player.getName() + " " + player.getLastName())
                            .gamePlayed(player.getGamePlayed())
                            .build());
        }
        return playerOptionsDTOS;
    }

    private List<PlayerDTO> getDTOList(List<Player> players) {
        List<PlayerDTO> playersDTOs = new ArrayList<>();
        for (Player player : players) {
            playersDTOs.add(modelMapper.map(player, PlayerDTO.class));
        }
        return playersDTOs;
    }

    private boolean playerExist(Player player) {
        Player dbPlayer = playerRepository.findByTeamIdAndNumber(player.getTeam().getTeamId(), player.getNumber()).orElse(null);
        if (dbPlayer == null) {
            return false;
        }
        return !Objects.equals(player.getPlayerId(), dbPlayer.getPlayerId());
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
        if (request.getIsActive() != db.getIsActive()) {
            db.setIsActive(request.getIsActive());
        }
        playerRepository.save(db);
    }
}
