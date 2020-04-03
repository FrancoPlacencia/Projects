package com.iba.repository;

import com.iba.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("roleRepository")
public interface RoleRepository extends JpaRepository<Role, Integer> {
    public static String ADMIN_ROLE = "ADMIN";

    Role findByRole(String role);

}
