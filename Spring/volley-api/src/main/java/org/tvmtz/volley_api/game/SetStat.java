package org.tvmtz.volley_api.game;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SetStat {
    private Integer setNumber;
    private Boolean isWinner;
    private Integer points;
}
