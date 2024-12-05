package org.tvmtz.volley_api.game;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface GameRepository extends JpaRepository<Game, Integer> {

    @Query(
            value = "SELECT * FROM games WHERE tournament_id = :tournamentId",
            nativeQuery = true
    )
    Optional<List<Game>> findByTournament(Integer tournamentId);

    @Query(
            value = "SELECT *" +
                    "FROM games " +
                    "WHERE tournament_id = :tournamentId " +
                    "AND week_number = :weekNumber " +
                    "ORDER BY game_date, IF(game_place = 'ARRIBA', 0,1) ASC",

            nativeQuery = true
    )
    Optional<List<Game>> findByTournamentAndWeekNumber(Integer tournamentId, Integer weekNumber);

    @Query(
            value = "SELECT week_number \n" +
                    "FROM games \n" +
                    "WHERE tournament_id = :tournamentId\n" +
                    "GROUP BY week_number\n" +
                    "ORDER BY week_number",
            nativeQuery = true
    )
    Optional<List<Integer>> weeksByTournament(Integer tournamentId);

    @Query(
            value = "SELECT * \n" +
                    "FROM games \n" +
                    "WHERE tournament_id = :tournamentId\n" +
                    "AND category = :category \n" +
                    "AND week_number = :weekNumber \n" +
                    "AND game_date = :gameDate \n" +
                    "AND team1 = :team1 \n" +
                    "AND team2 = :team2",
            nativeQuery = true
    )
    Optional<Game> findUnique(Integer tournamentId, String category, Integer weekNumber, Date gameDate, Integer team1, Integer team2);
}
