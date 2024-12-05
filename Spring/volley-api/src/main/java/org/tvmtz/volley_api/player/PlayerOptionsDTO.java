package org.tvmtz.volley_api.player;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PlayerOptionsDTO {

    private Integer playerId;

    private Integer number;

    private Boolean gamePlayed;
}
