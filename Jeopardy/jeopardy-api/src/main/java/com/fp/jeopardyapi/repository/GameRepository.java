package com.fp.jeopardyapi.repository;

import com.fp.jeopardyapi.model.Game;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GameRepository extends JpaRepository<Game, Integer> {

    List<Game> findAll();
/*
    @Query("SELECT q FROM question q WHERE q.game_id = :gameId")
    List<Question> findByGameId(@Param("gameId")  Integer gameId);

 */
}
