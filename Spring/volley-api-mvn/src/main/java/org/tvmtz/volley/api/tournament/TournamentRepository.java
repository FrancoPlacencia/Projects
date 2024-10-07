package org.tvmtz.volley.api.tournament;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface TournamentRepository extends JpaRepository<Tournament,Integer> {


    Optional<Tournament> findByName(String name);

    Optional<Tournament> findByYear(Integer year);

    Optional<Tournament> findByNameAndYear(String name, Integer year);

    @Query(
        value = "SELECT * FROM tournaments WHERE name = :name AND year = :year ",
        nativeQuery = true
    )
    Optional<Tournament> findUnique(String name, Integer year);

    Optional<Tournament> findByTournamentId(Integer tournamentId);
}
