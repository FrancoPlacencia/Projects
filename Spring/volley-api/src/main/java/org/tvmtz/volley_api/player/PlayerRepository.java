package org.tvmtz.volley_api.player;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface PlayerRepository extends JpaRepository<Player, Integer> {

    @Query(
            value = "SELECT * FROM players WHERE team_id = :teamId ORDER BY number",
            nativeQuery = true
    )
    Optional<List<Player>> findByTeam(Integer teamId);

    @Query(
            value = "SELECT players.* " +
                    "FROM players " +
                    "INNER JOIN games_played " +
                    "ON games_played.player_id = players.player_id " +
                    "AND games_played.game_id = :gameId " +
                    "WHERE team_id = :teamId " +
                    "ORDER BY number",
            nativeQuery = true
    )
    Optional<List<Player>> findByTeamGame(Integer teamId, Integer gameId);


    @Query(
            value = "SELECT players.* " +
                    "FROM players " +
                    "WHERE team_id = :teamId " +
                    "AND number = :number ",
            nativeQuery = true
    )
    Optional<Player> findByTeamIdAndNumber(Integer teamId, Integer number);
}
