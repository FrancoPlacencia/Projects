package org.tvmtz.volley_api.tournament;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface TournamentRepository extends JpaRepository<Tournament, Integer> {


    @Query(
            value = "SELECT * FROM tournaments WHERE name LIKE %:name%",
            nativeQuery = true
    )
    List<Tournament> findByName(String name);


    List<Tournament> findByYear(Integer year);

    @Query(
            value = "SELECT * FROM tournaments WHERE name LIKE %:name% and year = :year",
            nativeQuery = true
    )
    List<Tournament> findByNameAndYear(String name, Integer year);

    @Query(
            value = "SELECT * FROM tournaments WHERE name = :name AND year = :year ",
            nativeQuery = true
    )
    Optional<Tournament> findUnique(String name, Integer year);

    Optional<Tournament> findByTournamentId(Integer tournamentId);
}
