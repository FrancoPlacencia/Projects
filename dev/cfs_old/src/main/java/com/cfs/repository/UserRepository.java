package com.cfs.repository;

import com.cfs.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Long> {

    // Inferred Queries
    public User findByFirstName(String firstName);
/*
    // JPQL
    @Query(value="select u from user u where u.firstName = :firstName")
    public User findUserFirstNameJPQL(@Param("firstName") String firstName);

     SQL
    @Query(
            value = "select * from t_user as u where u.first_name = :firstName",
            nativeQuery = true)
    public User findByNameNativeQuery(@Param("firstName") String firstName);
    */
}
