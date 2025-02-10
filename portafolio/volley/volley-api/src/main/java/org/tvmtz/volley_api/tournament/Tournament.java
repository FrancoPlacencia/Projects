package org.tvmtz.volley_api.tournament;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "tournaments")
@DynamicUpdate
public class Tournament {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tournament_id")
    private Integer tournamentId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "year", nullable = false)
    private Integer year;

    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "rounds", nullable = false)
    private Integer rounds;

    @Column(name = "stage", nullable = false)
    private String stage;

    @Column(name = "regular_sets", nullable = false)
    private Integer regularSets;

    @Column(name = "elimination_sets", nullable = false)
    private Integer eliminationSets;

    @Column(name = "fem_elimination", nullable = false)
    private Integer femElimination;

    @Column(name = "var_elimination", nullable = false)
    private Integer varElimination;

    @Column(name = "mix_elimination", nullable = false)
    private Integer mixElimination;

    @Column(name = "url")
    private String url;

    @Column(name = "isActive")
    private Boolean isActive;
}
