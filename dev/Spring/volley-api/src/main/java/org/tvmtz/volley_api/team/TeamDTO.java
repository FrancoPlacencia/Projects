package org.tvmtz.volley_api.team;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.tvmtz.volley_api.player.Player;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TeamDTO {

    private Integer teamId;

    @NotNull(message = "The tournament ID is required.")
    private Integer tournamentId;

    private Integer teamNumber;

    @NotBlank(message = "The team name is required.")
    @Size(max = 20, message = "The name must be 20 chars max.")
    private String name;

    @NotBlank(message = "The initials is required.")
    @Size(max = 250, message = "The initials must be 8 chars max.")
    private String initials;

    @NotBlank(message = "The category is required.")
    @Size(max = 10, message = "The category must be 10 chars max.")
    private String category;

    private Integer gamesWon;
    private Integer gamesLost;

    private Integer setsWon;
    private Integer setsLost;

    private Integer pointsWon;
    private Integer pointsLost;

    private List<Player> players;

    private Boolean isActive;
}
