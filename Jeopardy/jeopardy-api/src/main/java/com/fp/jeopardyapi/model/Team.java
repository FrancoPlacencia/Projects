package com.fp.jeopardyapi.model;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name="team")
public class Team {
	
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "team_id")
    private Integer teamId;

    @Column(name = "name")
    private String name;

    @Column(name = "score")
    private Integer score;
    
    @Column(name = "game_id")
    private Integer gameId;

    @Override
    public String toString() {
        return "Team [" + 
        		this.teamId + "," +
                this.name + "," +
                this.score + "," +
                this.gameId +
                "]";
    }
}
