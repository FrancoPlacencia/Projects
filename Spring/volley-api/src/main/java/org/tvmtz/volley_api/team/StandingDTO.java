package org.tvmtz.volley_api.team;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StandingDTO {

    private Integer position;

    private String team;

    private Integer teamJJ;
    private Integer teamJG;
    private Integer teamJP;
    private Integer teamDJ;

    private Integer teamSG;
    private Integer teamSP;
    private Integer teamDS;

    private Integer teamPG;
    private Integer teamPP;
    private Integer teamDP;

}
