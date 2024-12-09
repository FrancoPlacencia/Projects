package org.tvmtz.volley_api.game;

import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.tvmtz.volley_api.common.CommonResponse;
import org.tvmtz.volley_api.player.PlayerOptionsDTO;
import org.tvmtz.volley_api.player.PlayerService;
import org.tvmtz.volley_api.team.Team;
import org.tvmtz.volley_api.tournament.Tournament;
import org.tvmtz.volley_api.util.AppConstants;
import org.tvmtz.volley_api.util.AppUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Slf4j
@Service
public class GameServiceImpl implements GameService {
    @Autowired
    GameRepository gameRepository;

    @Autowired
    PlayerService playerService;

    @Autowired
    GamePlayedRepository gamePlayedRepository;

    @Autowired
    ModelMapper modelMapper;

    @Override
    public ResponseEntity<CommonResponse> createGame(GameDTO gameDto) {
        log.info("createGame gameDto {}", gameDto);
        CommonResponse commonResponse;
        // VALIDATION
        if (AppUtil.isNullOrEmptyString(gameDto.getCategory()) ||
                AppUtil.isNullOrZeroOrLess(gameDto.getWeekNumber()) ||
                AppUtil.isNullOrEmptyString(gameDto.getGamePlace()) ||
                AppUtil.isNullOrZeroOrLess(gameDto.getTournamentId()) ||
                gameDto.getTeamStats().size() != 2
        ) {
            commonResponse = CommonResponse.builder().response(AppConstants.GAME + " " + AppConstants.BAD_REQUEST).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.BAD_REQUEST);
        }
        List<PlayerOptionsDTO> gamesPlayed = new ArrayList<>();
        Game game = buildGame(gameDto, gamesPlayed);
        // ALREADY EXISTS
        if (gameExists(game)) {
            commonResponse = CommonResponse.builder().response(AppConstants.GAME + " " + AppConstants.ALREADY_EXISTS).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.CONFLICT);
        }
        // CREATE
        gameRepository.save(game);
        saveGamesPlayed(gamesPlayed, game.getGameId());
        commonResponse = CommonResponse.builder().response(AppConstants.GAME + " " + AppConstants.CREATED).build();
        return new ResponseEntity<>(commonResponse, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<GameDTO>> getGames(Integer tournamentId, Integer weekNumber) {
        List<Game> games = gameRepository.findByTournamentAndWeekNumber(tournamentId, weekNumber).orElse(new ArrayList<>());
        if (games.isEmpty()) {
            return new ResponseEntity<>(new ArrayList<>(), HttpStatus.OK);
        }
        List<GameDTO> gamesDTOs = new ArrayList<>();
        for (Game game : games) {
            gamesDTOs.add(buildGameDTO(game));
        }
        return new ResponseEntity<>(gamesDTOs, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<WeekOptionDTO>> getWeekOptions(Integer tournamentId) {
        List<Integer> weeks = gameRepository.weeksByTournament(tournamentId).orElse(null);
        List<WeekOptionDTO> weekDTOs = new ArrayList<>();
        if (weeks == null) {
            return new ResponseEntity<>(weekDTOs, HttpStatus.NOT_FOUND);
        }
        for (Integer week : weeks) {
            weekDTOs.add(WeekOptionDTO.builder().weekNumber(week).tournamentId(tournamentId).build());
        }
        return new ResponseEntity<>(weekDTOs, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CommonResponse> updateGame(GameDTO gameDto) {
        log.info("UPDATE GAME {}", gameDto);
        CommonResponse commonResponse;

        List<String> errors = validateUpdate(gameDto);
        // VALIDATION
        if (!errors.isEmpty()) {
            commonResponse = CommonResponse.builder().response(AppConstants.GAME + " " + AppConstants.BAD_REQUEST).errors(errors).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.BAD_REQUEST);
        }
        List<PlayerOptionsDTO> gamesPlayed = new ArrayList<>();
        Game game = buildGame(gameDto, gamesPlayed);
        // ALREADY EXISTS
        if (gameExists(game)) {
            commonResponse = CommonResponse.builder().response(AppConstants.GAME + " " + AppConstants.ALREADY_EXISTS).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.CONFLICT);
        }
        // NOT FOUND
        Game dbGame = gameRepository.findById(game.getGameId()).orElse(null);
        if (dbGame == null) {
            commonResponse = CommonResponse.builder().response(AppConstants.GAME + " " + AppConstants.NOT_FOUND).errors(errors).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.NOT_FOUND);
        }
        // UPDATE
        updateGame(game, dbGame);
        clearGamesPlayed(game.getGameId());
        saveGamesPlayed(gamesPlayed, game.getGameId());
        commonResponse = CommonResponse.builder().response(AppConstants.GAME + " " + AppConstants.UPDATED).build();
        return new ResponseEntity<>(commonResponse, HttpStatus.OK);
    }


    private TeamStat buildTeamStat(Game game, Integer teamNumber) {
        TeamStat teamStat = TeamStat.builder()
                .teamId(teamNumber == 1 ? game.getTeam1().getTeamId() : game.getTeam2().getTeamId())
                .teamName(teamNumber == 1 ? game.getTeam1().getName() : game.getTeam2().getName())
                .isWinner(teamNumber == 1 ? game.getTeam1Sets() > game.getTeam2Sets() : game.getTeam2Sets() > game.getTeam1Sets())
                .score(teamNumber == 1 ? game.getTeam1Score() : game.getTeam2Score())
                .sets(teamNumber == 1 ? game.getTeam1Sets() : game.getTeam2Sets())
                .points(teamNumber == 1 ? game.getTeam1Points() : game.getTeam2Points())
                .players(playerService.getPlayersOptions(
                        teamNumber == 1 ? game.getTeam1().getTeamId() : game.getTeam2().getTeamId(), game.getGameId()))
                .build();
        List<SetStat> setStats = new ArrayList<>();
        Integer[] teamPoints = {
                game.getTeam1Set1Pts(),
                game.getTeam1Set2Pts(),
                game.getTeam1Set3Pts(),
                game.getTeam1Set4Pts(),
                game.getTeam1Set5Pts()
        };
        Integer[] vsPoints = {
                game.getTeam2Set1Pts(),
                game.getTeam2Set2Pts(),
                game.getTeam2Set3Pts(),
                game.getTeam2Set4Pts(),
                game.getTeam2Set5Pts()
        };
        for (int i = 0; i < teamPoints.length; i++) {
            SetStat setStat = buildSetStat(i, teamPoints[i], vsPoints[i], teamNumber);
            if (setStat != null) {
                setStats.add(setStat);
            }
        }
        teamStat.setSetStats(setStats);
        return teamStat;
    }

    private SetStat buildSetStat(Integer setNumber, Integer teamPoints, Integer vsPoints, Integer teamNumber) {
        setNumber++;
        return SetStat.builder()
                .setNumber(setNumber)
                .isWinner(teamNumber == 1 ? teamPoints > vsPoints : vsPoints > teamPoints)
                .points(teamNumber == 1 ? teamPoints : vsPoints)
                .build();
    }

    private Boolean gameExists(Game game) {
        Game dbGame = gameRepository.findUnique(
                game.getTournament().getTournamentId(),
                game.getCategory(),
                game.getWeekNumber(),
                game.getGameDate(),
                game.getTeam1().getTeamId(),
                game.getTeam2().getTeamId()).orElse(null);
        if (dbGame == null) {
            return false;
        }
        // log.info("gameExists {} - {}", game.getGameId(), dbGame.getGameId());
        return !Objects.equals(game.getGameId(), dbGame.getGameId());
    }

    private void updateGame(Game game, Game db) {
        db.setCategory(game.getCategory());
        db.setGameDate(game.getGameDate());
        db.setGamePlace(game.getGamePlace());
        db.setTeam1(game.getTeam1());
        db.setTeam1Score(game.getTeam1Score());
        db.setTeam1Sets(game.getTeam1Sets());
        db.setTeam1Points(game.getTeam1Points());
        db.setTeam1Set1Pts(game.getTeam1Set1Pts());
        db.setTeam1Set2Pts(game.getTeam1Set2Pts());
        db.setTeam1Set3Pts(game.getTeam1Set3Pts());
        db.setTeam1Set4Pts(game.getTeam1Set4Pts());
        db.setTeam1Set5Pts(game.getTeam1Set5Pts());

        db.setTeam2(game.getTeam2());
        db.setTeam2Score(game.getTeam2Score());
        db.setTeam2Sets(game.getTeam2Sets());
        db.setTeam2Points(game.getTeam2Points());
        db.setTeam2Set1Pts(game.getTeam2Set1Pts());
        db.setTeam2Set2Pts(game.getTeam2Set2Pts());
        db.setTeam2Set3Pts(game.getTeam2Set3Pts());
        db.setTeam2Set4Pts(game.getTeam2Set4Pts());
        db.setTeam2Set5Pts(game.getTeam2Set5Pts());
        gameRepository.save(game);
    }

    private GameDTO buildGameDTO(Game game) {
        List<TeamStat> teamStats = new ArrayList<>();
        teamStats.add(buildTeamStat(game, 1));
        teamStats.add(buildTeamStat(game, 2));
        return GameDTO.builder()
                .gameId(game.getGameId())
                .tournamentId(game.getTournament().getTournamentId())
                .category(game.getCategory())
                .weekNumber(game.getWeekNumber())
                .gameDate(game.getGameDate())
                .gamePlace(game.getGamePlace())
                .teamStats(teamStats)
                .byDefault(game.getByDefault())
                .build();
    }

    private Game buildGame(GameDTO gameDto, List<PlayerOptionsDTO> gamesPlayed) {
        Game game = Game.builder()
                .gameId(gameDto.getGameId())
                .tournament(Tournament.builder().tournamentId(gameDto.getTournamentId()).build())
                .category(gameDto.getCategory())
                .weekNumber(gameDto.getWeekNumber())
                .gameDate(gameDto.getGameDate())
                .gamePlace(gameDto.getGamePlace())
                .byDefault(gameDto.getByDefault())
                .build();
        List<SetStat> setStatsTeam1 = new ArrayList<>();
        List<SetStat> setStatsTeam2 = new ArrayList<>();
        for (int i = 0; i < gameDto.getTeamStats().size(); i++) {
            TeamStat teamStat = gameDto.getTeamStats().get(i);
            Team team = Team.builder().teamId(teamStat.getTeamId()).build();
            gamesPlayed.addAll(teamStat.getPlayers());
            if (i == 0) {
                game.setTeam1(team);
                if (!teamStat.getSetStats().isEmpty()) {
                    for (int j = 0; j < teamStat.getSetStats().size(); j++) {
                        SetStat setStat = teamStat.getSetStats().get(j);
                        setStatsTeam1.add(setStat);
                        switch (j) {
                            case 0:
                                game.setTeam1Set1Pts(setStat.getPoints());
                                break;
                            case 1:
                                game.setTeam1Set2Pts(setStat.getPoints());
                                break;
                            case 2:
                                game.setTeam1Set3Pts(setStat.getPoints());
                                break;
                            case 3:
                                game.setTeam1Set4Pts(setStat.getPoints());
                                break;
                            case 4:
                                game.setTeam1Set5Pts(setStat.getPoints());
                                break;
                            default:
                                break;
                        }
                    }
                }
            } else {
                game.setTeam2(team);
                if (!teamStat.getSetStats().isEmpty()) {
                    for (int j = 0; j < teamStat.getSetStats().size(); j++) {
                        SetStat setStat = teamStat.getSetStats().get(j);
                        setStatsTeam2.add(setStat);
                        switch (j) {
                            case 0:
                                game.setTeam2Set1Pts(setStat.getPoints());
                                break;
                            case 1:
                                game.setTeam2Set2Pts(setStat.getPoints());
                                break;
                            case 2:
                                game.setTeam2Set3Pts(setStat.getPoints());
                                break;
                            case 3:
                                game.setTeam2Set4Pts(setStat.getPoints());
                                break;
                            case 4:
                                game.setTeam2Set5Pts(setStat.getPoints());
                                break;
                            default:
                                break;
                        }
                    }
                }
            }
        }

        // POINTS, SETS AND SCORE
        int team1Points = 0;
        int team2Points = 0;
        int team1Sets = 0;
        int team2Sets = 0;
        for (int i = 0; i < setStatsTeam1.size(); i++) {
            int team1Pts = setStatsTeam1.get(i).getPoints();
            int team2Pts = setStatsTeam2.get(i).getPoints();
            if (team1Pts != 0 && team2Pts != 0) {
                if (team1Pts > team2Pts) {
                    team1Sets++;
                }
                if (team1Pts < team2Pts) {
                    team2Sets++;
                }
                team1Points += team1Pts;
                team2Points += team2Pts;
            }
        }
        game.setTeam1Points(team1Points);
        game.setTeam1Sets(team1Sets);

        game.setTeam2Points(team2Points);
        game.setTeam2Sets(team2Sets);

        game.setTeam1Score(team1Sets > team2Sets ? 1 : 0);
        game.setTeam2Score(team1Sets < team2Sets ? 1 : 0);

        return game;
    }

    private void saveGamesPlayed(List<PlayerOptionsDTO> gamesPlayed, Integer gameId) {
        for (PlayerOptionsDTO player : gamesPlayed) {
            if (player.getGamePlayed() != null && player.getGamePlayed()) {
                gamePlayedRepository.save(GamePlayed.builder()
                        .gameId(gameId)
                        .playerId(player.getPlayerId())
                        .build());
            }

        }
    }

    private void clearGamesPlayed(Integer gameId) {
        // Clear games played
        gamePlayedRepository.deleteByGame(gameId);
    }

    private List<String> validateUpdate(GameDTO gameDto) {
        List<String> errors = new ArrayList<>();
        if (AppUtil.isNullOrEmptyString(gameDto.getCategory())) {
            errors.add("Missing category");
        }
        if (AppUtil.isNullOrZeroOrLess(gameDto.getWeekNumber())) {
            errors.add("Missing week number");
        }
        if (AppUtil.isNullOrZeroOrLess(gameDto.getTournamentId())) {
            errors.add("Missing tournament data");
        }
        if (AppUtil.isNullOrZeroOrLess(gameDto.getGameId())) {
            errors.add("Missing game data");
        }
        if (AppUtil.isNullOrEmptyString(gameDto.getCategory())) {
            errors.add("Missing category");
        }
        if (gameDto.getTeamStats().size() != 2) {
            errors.add("Missing one or both teams");
        }
        return errors;
    }

}
