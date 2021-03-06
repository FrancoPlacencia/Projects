package com.fp.jeopardyapi.repository;

import com.fp.jeopardyapi.model.Team;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeamRepository extends JpaRepository<Team, Integer> {

    List<Team> findAll();

    @Query("SELECT t FROM Team t WHERE t.gameId = :gameId")
    List<Team> findByGame(@Param("gameId") Integer gameId);
    
    @Query("SELECT t FROM Team t WHERE t.teamId = :teamId")
    Team findByQuestion(@Param("teamId") Integer teamId);
}
