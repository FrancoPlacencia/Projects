package com.springlearning.repository;

import static org.junit.jupiter.api.Assertions.assertNotNull;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;


@DataJpaTest
public class UserRepositoryTest {

    /*
    @Autowired private DataSource dataSource;
    @Autowired private JdbcTemplate jdbcTemplate;
    @Autowired private EntityManager entityManager;
     */
    @Autowired 
    private UserRepository userRepository;

    @Test
    public void injectedComponentsAreNotNull(){ /*
      assertNotNull(dataSource);
      assertNotNull(jdbcTemplate);
      assertNotNull(entityManager);
      */
      assertNotNull(userRepository);
    }
/* 
    @Test
    public void testFetchByFirstName() {
        User testUser1 = this.userRepository.findByFirstName("hola");
        assertNotNull(testUser1);
        assertEquals("mundo", testUser1.getLastName());
    }
*/
    
}
