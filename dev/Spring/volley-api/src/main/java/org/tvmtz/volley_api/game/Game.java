package org.tvmtz.volley_api.game;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;
import org.tvmtz.volley_api.team.Team;
import org.tvmtz.volley_api.tournament.Tournament;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "games")
@DynamicUpdate
public class Game {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "game_id")
    private Integer gameId;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "tournament_id")
    private Tournament tournament;

    @Column(name = "category")
    private String category;

    @Column(name = "week_number")
    private Integer weekNumber;

    @Column(name = "game_date")
    private Date gameDate;

    @Column(name = "game_place")
    private String gamePlace;

    @OneToOne
    @JoinColumn(name = "team_1")
    private Team team1;

    @Column(name = "team_1_score")
    private Integer team1Score;

    @Column(name = "team_1_sets")
    private Integer team1Sets;

    @Column(name = "team_1_points")
    private Integer team1Points;

    @Column(name = "team_1_set_1_pts")
    private Integer team1Set1Pts;
    @Column(name = "team_1_set_2_pts")
    private Integer team1Set2Pts;
    @Column(name = "team_1_set_3_pts")
    private Integer team1Set3Pts;
    @Column(name = "team_1_set_4_pts")
    private Integer team1Set4Pts;
    @Column(name = "team_1_set_5_pts")
    private Integer team1Set5Pts;

    @OneToOne
    @JoinColumn(name = "team_2")
    private Team team2;

    @Column(name = "team_2_score")
    private Integer team2Score;

    @Column(name = "team_2_sets")
    private Integer team2Sets;

    @Column(name = "team_2_points")
    private Integer team2Points;

    @Column(name = "team_2_set_1_pts")
    private Integer team2Set1Pts;
    @Column(name = "team_2_set_2_pts")
    private Integer team2Set2Pts;
    @Column(name = "team_2_set_3_pts")
    private Integer team2Set3Pts;
    @Column(name = "team_2_set_4_pts")
    private Integer team2Set4Pts;
    @Column(name = "team_2_set_5_pts")
    private Integer team2Set5Pts;

    @Column(name = "by_default")
    private Boolean byDefault;
}
