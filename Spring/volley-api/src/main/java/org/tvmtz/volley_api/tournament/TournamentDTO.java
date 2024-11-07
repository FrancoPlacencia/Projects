package org.tvmtz.volley_api.tournament;

import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TournamentDTO {

    private UUID uuid;

    @NotBlank(message = "The name is required.")
    @Size(max = 50, message = "The name must be 50 chars max.")
    private String name;

    @NotNull(message = "The year is required.")
    @Min(value = 1900, message = "The year must be greater than 1900.")
    @Max(value = 2100, message = "The year must be lower than 2100")
    private Integer year;

    @NotBlank(message = "The description is required.")
    @Size(max = 250, message = "The description must be 250 chars max.")
    private String description;

    @NotNull(message = "Rounds number is required.")
    private Integer rounds;

    @NotBlank(message = "URL is required.")
    private String url;
}
