package org.tvmtz.volley_api.tournament;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface TournamentRepository extends JpaRepository<Tournament, Integer> {
    @Query(
            value = "SELECT * FROM tournaments WHERE is_active = true LIMIT 1",
            nativeQuery = true
    )
    Optional<Tournament> findActive();

    Optional<Tournament> findByNameAndYear(String name, Integer year);

    Optional<Tournament> findByTournamentId(Integer tournamentId);

}
