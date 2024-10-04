package com.fp.jeopardyapi.repository;

import com.fp.jeopardyapi.model.Category;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

    List<Category> findAll();
    
    @Query("SELECT c FROM Category c WHERE c.gameId = :gameId")
    List<Category> findByGameId(@Param("gameId") Integer gameId);

    @Query("SELECT c FROM Category c WHERE c.gameId = :gameId and c.categoryNumber = :questionNumber")
	Category findByQuestion(@Param("gameId") Integer gameId, @Param("questionNumber") Integer questionNumber);

}
