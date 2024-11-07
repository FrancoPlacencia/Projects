package team;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface TeamRepository extends JpaRepository<Team, UUID> {
/*
    @Query(
            value = "SELECT * FROM team WHERE tournament_id = :tournamentId AND name = :name AND number = :number",
            nativeQuery = true
    )
    Optional<Team> findUnique(String uuid, String name, Integer number);

 */
}
