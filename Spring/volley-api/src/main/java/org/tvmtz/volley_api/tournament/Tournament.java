package org.tvmtz.volley_api.tournament;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "tournaments")
@DynamicUpdate
public class Tournament {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "tournament_uuid")
    private UUID tournamentUuid;

    @Column(name = "name", columnDefinition = "VARCHAR(50)", nullable = false)
    private String name;

    @Column(name = "year", nullable = false)
    private Integer year;

    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "rounds", nullable = false)
    private Integer rounds;

    @Column(name = "url")
    private String url;
}
