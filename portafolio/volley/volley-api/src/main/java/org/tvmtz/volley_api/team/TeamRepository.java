package org.tvmtz.volley_api.team;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface TeamRepository extends JpaRepository<Team, Integer> {

    @Query(
            value = "SELECT * FROM teams WHERE tournament_id = :tournamentId AND name = :name AND category = :category",
            nativeQuery = true
    )
    Optional<Team> findUnique(Integer tournamentId, String name, String category);

    @Query(
            value = "SELECT * FROM teams WHERE tournament_id = :tournamentId AND category = :category AND stage = :stage ORDER BY team_number",
            nativeQuery = true
    )
    Optional<List<Team>> findByTournamentAndCategoryAndStage(Integer tournamentId, String category, String stage);

    @Query(
            value = "SELECT * FROM teams WHERE tournament_id = :tournamentId ORDER BY name",
            nativeQuery = true
    )
    Optional<List<Team>> findByTournament(Integer tournamentId);

    @Query(
            value = "SELECT * FROM teams WHERE tournament_id = :tournamentId AND stage = :stage ORDER BY name",
            nativeQuery = true
    )
    Optional<List<Team>> findByTournamentAndStage(Integer tournamentId, String stage);


    @Query(value = "\n" +
            "SELECT \n" +
            "ROW_NUMBER() OVER (\n" +
            "ORDER BY \n" +
            "\tteamJG DESC,\n" +
            "\tteamDJ DESC,\n" +
            "\tteamSG DESC,\n" +
            "\tteamDS DESC,\n" +
            "\tteamPG DESC,\n" +
            "\tteamDP DESC\n" +
            ") AS position,\n" +
            "teams.*\n" +
            "FROM (\n" +
            "\tSELECT \n" +
            "\t\tname AS team, \n" +
            "\t\tgames_won + games_lost AS teamJJ,\n" +
            "\t\tgames_won AS teamJG,\n" +
            "\t\tgames_lost AS teamJP,\n" +
            "\t\tgames_won - games_lost AS teamDJ,\n" +
            "\t\tsets_won AS teamSG,\n" +
            "\t\tsets_lost AS teamSP,\n" +
            "\t\tsets_won - sets_lost AS teamDS,\n" +
            "\t\tpoints_won AS teamPG,\n" +
            "\t\tpoints_lost AS teamPP,\n" +
            "\t\tpoints_won - points_lost AS teamDP\n" +
            "\tFROM teams\n" +
            "\tWHERE tournament_id = :tournamentId\n" +
            "\tAND category = :category\n" +
            ") AS teams", nativeQuery = true)
    Optional<List<Standing>> getStandings(Integer tournamentId, String category);
}
