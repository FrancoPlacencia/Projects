package org.tvmtz.volley_api.team;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TeamOptionsDTO {
    private Integer teamId;

    private String name;

    private String category;

}
