package org.tvmtz.volley_api.player;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PlayerDTO {

    private Integer playerId;

    @NotNull(message = "The team ID is required.")
    private Integer teamId;

    @NotBlank(message = "The first name is required.")
    @Size(max = 100, message = "The first name must be 100 chars max.")
    private String name;

    @NotBlank(message = "The last name is required.")
    @Size(max = 100, message = "The last name must be 100 chars max.")
    private String lastName;

    @NotNull(message = "The player number is required.")
    private Integer number;
}
