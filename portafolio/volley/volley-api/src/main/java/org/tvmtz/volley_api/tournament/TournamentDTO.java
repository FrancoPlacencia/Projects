package org.tvmtz.volley_api.tournament;

import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TournamentDTO {

    private Integer tournamentId;

    @NotBlank(message = "The name is required.")
    @Size(max = 50, message = "The name must be 50 chars max.")
    private String name;

    @NotNull(message = "The year is required.")
    @Min(value = 1900, message = "The year must be greater than 1900.")
    @Max(value = 2100, message = "The year must be lower than 2100")
    private Integer year;

    @NotBlank(message = "The description is required.")
    @Size(max = 255, message = "The description must be 250 chars max.")
    private String description;

    @NotNull(message = "Rounds number is required.")
    private Integer rounds;

    @NotBlank(message = "Stage is required.")
    private String stage;

    @NotNull(message = "Number of sets for Regular stage its required.")
    private Integer regularSets;

    @NotNull(message = "Number of sets for Eliminations stage its required.")
    private Integer eliminationSets;

    @NotNull(message = "Number of teams for Eliminations stage for FEM its required.")
    private Integer femElimination;
    @NotNull(message = "Number of teams for Eliminations stage for VAR its required.")
    private Integer varElimination;
    @NotNull(message = "Number of teams for Eliminations stage for MIX its required.")
    private Integer mixElimination;

    @NotBlank(message = "URL is required.")
    private String url;

    @NotNull(message = "Please specify if its the active tournament.")
    private Boolean isActive;

    private List<Integer> weeks;

    private List<String> eliminations;
}
