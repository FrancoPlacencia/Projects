package com.fpc.chfs.churchfinancialsystem.church;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


@Repository
public interface ChurchRepository extends JpaRepository<Church,Integer> {

    Optional<Church> findByName(String name);

    Optional<Church> findByChurchId(Integer churchId);
/*
    @Query(
            value=  "SELECT ch.* " +
                    "FROM churches ch " +
                    "INNER JOIN categories ct " +
                    "ON ct.church_id = ch.church_id",
            nativeQuery = true
    )
*/
    @Query("SELECT c FROM Church c JOIN FETCH c.categories")
    List<Church> findAllJoined();

    @Query(
            value= "SELECT ch.* FROM churches ch INNER JOIN permissions p ON ch.church_id = p.church_id WHERE p.user_id = :userId",
            nativeQuery = true
    )
    List<Church> findAllByUserId(@Param("userId") Integer userId);


    @Query(
        value= "SELECT ch.* FROM churches ch WHERE ch.church_id NOT IN (SELECT p.church_id FROM permissions p WHERE p.user_id = :userId)",
        nativeQuery = true
    )
    List<Church> findAllMissingByUser(@Param("userId") Integer userId);
}
