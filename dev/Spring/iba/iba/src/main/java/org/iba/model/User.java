package org.iba.model;

import jakarta.persistence.*;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class User {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private Long id;

    @Column(name="name")
    private String name;

    public User() {}

    public User(String name){
        this.name = name;
    }

/*
    public String getUsernam(){
        return this.username;
    }

    public void setUsername() {

    }

 */
    
}
