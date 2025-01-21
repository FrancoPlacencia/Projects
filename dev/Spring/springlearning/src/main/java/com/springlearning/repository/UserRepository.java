package com.springlearning.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.springlearning.model.User;


public interface UserRepository extends JpaRepository<User, Long>{

    // Inferred Queries
    public User findByFirstName(String firstName);

    // JPQL
    @Query("select u from user u where u.firstName = :firstName")
    public User findByFirstNameJPQL(@Param("firstName") String firstName);

    // SQL
    @Query(
        value = "select * from t_user as u where u.first_name = :firstName",
        nativeQuery = true)
    public User findByNameNativeQuery(@Param("firstName") String firstName);
    
}
