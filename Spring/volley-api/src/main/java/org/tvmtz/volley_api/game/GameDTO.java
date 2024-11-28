package org.tvmtz.volley_api.game;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.tvmtz.volley_api.team.Team;
import org.tvmtz.volley_api.tournament.Tournament;

import java.util.Date;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GameDTO {

    private UUID gameUuid;

    private Tournament tournament;

    private String category;

    private Integer weekNumber;

    private Date gameDate;

    private String gamePlace;

    private Team team1;

    private Integer team1Score;

    private Integer team1Sets;

    private Integer team1Points;

    private Integer team1Set1Pts;
    private Integer team1Set2Pts;
    private Integer team1Set3Pts;
    private Integer team1Set4Pts;
    private Integer team1Set5Pts;

    private Team team2;

    private Integer team2Score;

    private Integer team2Sets;

    private Integer team2Points;

    private Integer team2Set1Pts;
    private Integer team2Set2Pts;
    private Integer team2Set3Pts;
    private Integer team2Set4Pts;
    private Integer team2Set5Pts;

    private Boolean byDefault;

}
