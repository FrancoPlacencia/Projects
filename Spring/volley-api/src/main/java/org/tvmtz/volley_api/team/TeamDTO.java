package org.tvmtz.volley_api.team;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TeamDTO {

    private UUID teamUuid;

    @NotNull(message = "The tournament UUID is required.")
    private UUID tournamentUuid;
    
    @NotBlank(message = "The description is required.")
    @Size(max = 250, message = "The description must be 250 chars max.")
    private String name;

    @NotBlank(message = "The description is required.")
    @Size(max = 250, message = "The description must be 250 chars max.")
    private String initials;

    @NotBlank(message = "The description is required.")
    @Size(max = 250, message = "The description must be 250 chars max.")
    private String category;

    private Boolean isActive;
}
