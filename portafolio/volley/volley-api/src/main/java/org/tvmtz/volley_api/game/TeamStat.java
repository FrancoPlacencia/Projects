package org.tvmtz.volley_api.game;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.tvmtz.volley_api.player.PlayerOptionsDTO;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TeamStat {

    private Integer teamId;

    private String teamName;

    private List<PlayerOptionsDTO> players;

    private Integer score;
    private Integer sets;
    private Integer points;

    private String state;

    private List<SetStat> setStats;
}
