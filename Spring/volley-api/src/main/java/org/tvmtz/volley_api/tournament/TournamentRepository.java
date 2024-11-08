package org.tvmtz.volley_api.tournament;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface TournamentRepository extends JpaRepository<Tournament, Integer> {


    @Query(
            value = "SELECT * FROM tournaments WHERE name LIKE %:name% OR year = :year",
            nativeQuery = true
    )
    List<Tournament> findByLikeNameOrYear(String name, Integer year);

    Optional<Tournament> findByNameOrYear(String name, Integer year);


    Optional<Tournament> findByNameAndYear(String name, Integer year);

    Optional<Tournament> findByTournamentUuid(UUID tournamentUuid);

}
