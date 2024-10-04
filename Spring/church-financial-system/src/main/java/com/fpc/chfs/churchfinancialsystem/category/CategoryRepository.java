package com.fpc.chfs.churchfinancialsystem.category;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {
    boolean existsByName(String name);
    Optional<Category> findByName(String name);

    @Query(value="SELECT * FROM categories WHERE church_id = :churchId", nativeQuery = true)
    List<Category> findByChurchId(@Param("churchId") Integer churchId);

    @Query(
        value= "UPDATE categories SET church_id = :churchId WHERE category_id = :categoryId",
        nativeQuery = true
    )
    @Modifying
    @Transactional
    void updateCategoryChurch(@Param("churchId") Integer churchId,@Param("categoryId") Integer categoryId);

    @Query(
            value= "UPDATE categories SET fund_id = :fundId WHERE category_id = :categoryId",
            nativeQuery = true
    )
    @Modifying
    @Transactional
    void updateCategoryFund(@Param("fundId") Integer churchId,@Param("categoryId") Integer categoryId);
}
