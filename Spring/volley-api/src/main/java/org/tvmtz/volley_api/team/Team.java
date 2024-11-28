package org.tvmtz.volley_api.team;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;
import org.tvmtz.volley_api.tournament.Tournament;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "teams")
@DynamicUpdate
public class Team {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "team_uuid")
    private UUID teamUuid;

    @Column(name = "name")
    private String name;

    @Column(name = "initials")
    private String initials;

    @Column(name = "category")
    private String category;

    @Column(name = "is_active")
    private Boolean isActive;

    @OneToOne
    @JoinColumn(name = "tournament_uuid")
    private Tournament tournament;
}
