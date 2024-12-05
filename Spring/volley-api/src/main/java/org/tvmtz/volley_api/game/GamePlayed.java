package org.tvmtz.volley_api.game;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "games_played")
@DynamicUpdate
public class GamePlayed {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "games_played_id")
    private Integer gamesPlayedId;

    @Column(name = "player_id")
    private Integer playerId;

    @Column(name = "game_id")
    private Integer gameId;
}
