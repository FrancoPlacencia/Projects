package org.tvmtz.volley_api.game;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface GamePlayedRepository extends JpaRepository<GamePlayed, Integer> {

    @Query(
            value = "DELETE FROM games_played WHERE game_id = :gameId",
            nativeQuery = true
    )
    void deleteByGame(Integer gameId);
}
