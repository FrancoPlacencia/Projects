package org.tvmtz.volley.api.team;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;
import org.tvmtz.volley.api.tournament.Tournament;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "teams")
@DynamicUpdate
public class Team {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "team_id")
    private Integer id;

    @OneToOne
    @JoinColumn(name ="tournament_id")
    private Tournament tournament;

    @Column(name = "number")
    private Integer number;

    @Column(name = "initials", columnDefinition = "VARCHAR(5)")
    private String initials;

    @Column(name = "name", columnDefinition = "VARCHAR(20)")
    private String name;

    @Column(name ="img_url")
    private String imgUrl;

}

