package org.iba.ibaspring.repository;

import org.iba.ibaspring.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long>{
    
}
