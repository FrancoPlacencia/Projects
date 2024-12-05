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

    @Column(name = "name")
    private String name;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "number")
    private Integer number;

    @Transient
    private Boolean gamePlayed;

}
