package org.tvmtz.volley_api.player;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.DynamicUpdate;
import org.tvmtz.volley_api.team.Team;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "players")
@DynamicUpdate
public class Player {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "player_id")
    private Integer playerId;

    @ManyToOne
    @JoinColumn(name = "team_id")
    // @JsonBackReference
    @JsonIgnoreProperties("players")
    @JsonIgnore
    @ToString.Exclude
    private Team team;

    @Column(name = "number")
    private Integer number;

    @Column(name = "name")
    private String name;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "games_played")
    private Integer gamesPlayed;

    @Column(name = "games_total")
    private Integer gamesTotal;

    @Column(name = "games_percentage")
    private Integer gamesPercentage;

    @Column(name = "is_active")
    private Boolean isActive;

    @Transient
    private Boolean gamePlayed;

}
