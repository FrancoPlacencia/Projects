package org.tvmtz.volley_api.game;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface GameRepository extends JpaRepository<Game, UUID> {

    @Query(
            value = "SELECT * FROM games WHERE tournament_uuid = :tournamentUuid LIMIT 1",
            nativeQuery = true
    )
    Optional<List<Game>> findByTournament(String tournamentUuid);

    @Query(
            value = "SELECT week_number \n" +
                    "FROM games \n" +
                    "WHERE tournament_uuid = :tournamentUuid\n" +
                    "GROUP BY week_number\n" +
                    "ORDER BY week_number",
            nativeQuery = true
    )
    Optional<List<Integer>> weeksByTournament(String tournamentUuid);
}
