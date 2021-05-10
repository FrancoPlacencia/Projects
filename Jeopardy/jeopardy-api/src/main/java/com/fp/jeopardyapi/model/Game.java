package com.fp.jeopardyapi.model;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name="game")
public class Game {
	
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "game_id")
    private Integer gameId;

    @Column(name = "game_desc")
    private String description;

    @Column(name = "rounds")
    private Integer rounds;
    
    @Column(name = "quizzes")
    private Integer quizzes;
    
    @Column(name = "categories")
    private Integer categories;
    
    @Column(name = "user_id")
    private Integer userId;
    
    @Override
    public String toString() {
        return "Game [" + this.gameId + "," +
                this.description + "," +
                this.rounds + "," +
                this.quizzes + "," +
                this.categories + "," +
                this.userId + 
                "]";
    }
}
