package org.tvmtz.volley_api.team;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface TeamRepository extends JpaRepository<Team, UUID> {
    /*
        @Query(
                value = "SELECT * FROM team WHERE tournament_id = :tournamentId AND name = :name AND number = :number",
                nativeQuery = true
        )
        Optional<Team> findUnique(String uuid, String name, Integer number);

     */
    @Query(
            value = "SELECT * FROM teams WHERE tournament_uuid = :tournamentUuid AND category = :category",
            nativeQuery = true
    )
    Optional<List<Team>> findByTournamentAndCategory(String tournamentUuid, String category);
}
