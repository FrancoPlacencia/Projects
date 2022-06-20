package com.fp.jeopardyapi.repository;

import com.fp.jeopardyapi.model.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionRepository extends JpaRepository<Question, Integer> {

    List<Question> findAll();
/*
    @Query("SELECT q FROM question q WHERE q.game_id = :gameId")
    List<Question> findByGameId(@Param("gameId")  Integer gameId);

 */
    List<Question> findByGameId(Integer gameId);

    List<Question> findByGameIdQuizId(Integer gameId, Integer quizId);
    
    List<Question> findByGameRoundQuizz(Integer gameId, Integer round, Integer quizz);

}
