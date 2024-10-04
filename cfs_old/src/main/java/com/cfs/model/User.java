package com.cfs.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Long id;

    @Column(name="firstName")
    String firstName;

    @Column(name="lastName")
    String lastName;

    String email;

}
