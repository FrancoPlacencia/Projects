package com.fp.jeopardyapi.model;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

import org.springframework.data.jpa.repository.Query;

@Getter
@Setter
@Entity
@Table(name="question")
@NamedQuery(name = "Question.findByGameId", query = "SELECT q FROM Question q WHERE q.gameId = ?1")
@NamedQuery(name = "Question.findByGameIdQuizId", query = "SELECT q FROM Question q WHERE q.gameId = ?1 and q.quizz = ?2")
@NamedQuery(name=  "Question.findByGameRoundQuizz", query= "SELECT q FROM Question q WHERE q.gameId = ?1 and q.round = ?2 and q.quizz = ?3")
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "question_id")
    private Integer questionId;

    @Column(name = "game_id")
    private Integer gameId;

    @Column(name = "round")
    private Integer round;
    
    @Column(name = "quizz")
    private Integer quizz;

    @Column(name = "question_number")
    private Integer questionNumber;

    @Column(name = "question_content")
    private String questionContent;

    @Column(name = "answer")
    private String answer;

    @Column(name = "completed")
    private Integer completed;
    
    @Column(name = "team_id")
    private Integer teamId;
    
    

    @Override
    public String toString() {
        return "Question [" + this.questionId + "," +
                this.gameId + "," +
                this.round + "," +
                this.quizz + "," +
                this.questionNumber + "," +
                this.questionContent + "," +
                this.answer + "," +
                this.teamId +                
                "]";
    }
}
