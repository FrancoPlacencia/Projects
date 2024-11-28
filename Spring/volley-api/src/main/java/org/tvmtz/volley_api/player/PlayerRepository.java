package org.tvmtz.volley_api.player;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.tvmtz.volley_api.team.Team;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface PlayerRepository extends JpaRepository<Player, UUID> {

    @Query(
            value = "SELECT * FROM players WHERE team_uuid = :teamUuid",
            nativeQuery = true
    )
    Optional<List<Player>> findByTeam(String teamUuid);

    Optional<Player> findByTeamAndNumber(Team team, Integer number);
}
