package org.tvmtz.volley_api.game;

import org.springframework.data.jpa.repository.JpaRepository;

public interface GamePlayedRepository extends JpaRepository<GamePlayed, Integer> {
}
