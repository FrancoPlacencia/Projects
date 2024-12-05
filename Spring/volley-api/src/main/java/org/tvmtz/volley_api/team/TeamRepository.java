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
            value = "SELECT * FROM teams WHERE tournament_id = :tournamentId AND category = :category",
            nativeQuery = true
    )
    Optional<List<Team>> findByTournamentAndCategory(Integer tournamentId, String category);

    @Query(
            value = "SELECT * FROM teams WHERE tournament_id = :tournamentId",
            nativeQuery = true
    )
    Optional<List<Team>> findByTournament(Integer tournamentId);

}
