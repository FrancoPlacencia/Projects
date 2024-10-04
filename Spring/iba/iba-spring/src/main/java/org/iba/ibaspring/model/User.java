package org.iba.ibaspring.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    // @Column(name="id")
    private Long id;

    // @Column(name="name")
    private String name;

    public User() {

    }

    public User(String name) {
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    /*
     * //@Column(name="email")
     * private String email;
     * 
     * //@Column(name="password")
     * private String password;
     * 
     * //@Column(name="enable")
     * private Boolean enable;
     * 
     */
}
