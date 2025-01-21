package com.fpc.chfs.churchfinancialsystem.fund;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface FundRepository extends JpaRepository<Fund, Integer> {
    boolean existsByName(String name);
    Optional<Fund> findByName(String name);
    Optional<Fund> findByFundId(Integer fundId);
}
