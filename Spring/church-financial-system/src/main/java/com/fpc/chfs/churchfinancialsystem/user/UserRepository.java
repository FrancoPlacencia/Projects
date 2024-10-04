package com.fpc.chfs.churchfinancialsystem.user;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.fpc.chfs.churchfinancialsystem.user.User;

@Repository
public interface UserRepository extends JpaRepository<User,Integer>{
    Optional<User> findByUserId(Integer userId);

    Optional<User> findByEmail(String email);

    @Query(value = "SELECT * FROM users WHERE email = :email", nativeQuery = true)
    Optional<User> findByEmailSQL(String email);

}
