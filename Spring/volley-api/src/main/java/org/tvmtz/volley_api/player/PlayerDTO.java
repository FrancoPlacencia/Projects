package org.tvmtz.volley_api.player;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PlayerDTO {

    private UUID playerUuid;

    private UUID teamUuid;

    private String name;

    private String lastName;

    private Integer number;
}
