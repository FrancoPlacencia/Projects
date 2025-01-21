package org.iba.configuration;

import org.iba.model.User;
import org.iba.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class LoadDatabase {

    @Bean
    public CommandLineRunner initDatabase(UserRepository repository) {

    return args -> {
      repository.save(new User("Franco"));
    };
  }
    
}
