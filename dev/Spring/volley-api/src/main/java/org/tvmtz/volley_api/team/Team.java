package org.tvmtz.volley_api.team;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;
import org.tvmtz.volley_api.player.Player;
import org.tvmtz.volley_api.tournament.Tournament;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "teams")
@DynamicUpdate
public class Team {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "team_id")
    private Integer teamId;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "tournament_id")
    private Tournament tournament;

    @Column(name = "team_number")
    private Integer teamNumber;

    @Column(name = "name")
    private String name;

    @Column(name = "initials")
    private String initials;

    @Column(name = "category")
    private String category;

    @Column(name = "is_active")
    private Boolean isActive;

    @Column(name = "games_won")
    private Integer gamesWon;

    @Column(name = "games_lost")
    private Integer gamesLost;

    @Column(name = "sets_won")
    private Integer setsWon;

    @Column(name = "sets_lost")
    private Integer setsLost;

    @Column(name = "points_won")
    private Integer pointsWon;

    @Column(name = "points_lost")
    private Integer pointsLost;

    @OneToMany(mappedBy = "team", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    @JsonIgnoreProperties("team")
    private List<Player> players;


}
