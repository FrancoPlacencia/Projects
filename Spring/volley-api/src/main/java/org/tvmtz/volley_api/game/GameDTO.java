package org.tvmtz.volley_api.game;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GameDTO {
    private Integer gameId;

    private Integer tournamentId;

    private Integer weekNumber;

    private String category;

    private Date gameDate;
    private String gamePlace;

    private Boolean byDefault;

    private List<TeamStat> teamStats;


}
