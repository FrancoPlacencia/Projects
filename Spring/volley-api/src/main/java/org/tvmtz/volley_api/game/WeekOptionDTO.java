package org.tvmtz.volley_api.game;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class WeekOptionDTO {

    Integer tournamentId;

    Integer weekNumber;
}
