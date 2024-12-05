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

    @NotBlank(message = "The description is required.")
    @Size(max = 250, message = "The description must be 250 chars max.")
    private String name;

    @NotBlank(message = "The description is required.")
    @Size(max = 250, message = "The description must be 250 chars max.")
    private String initials;

    @NotBlank(message = "The description is required.")
    @Size(max = 250, message = "The description must be 250 chars max.")
    private String category;

    private List<Player> players;

    private Boolean isActive;
}
