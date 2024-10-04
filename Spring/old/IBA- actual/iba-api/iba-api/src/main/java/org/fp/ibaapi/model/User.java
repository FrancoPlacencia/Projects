package org.fp.ibaapi.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
/*
CREATE TABLE user (
  id 		INTEGER NOT NULL AUTO_INCREMENT,
  name 		VARCHAR(300) NOT NULL,
  email  	VARCHAR(250) NOT NULL,
  password 	VARCHAR(300) NOT NULL,
  enable 	CHAR,
  PRIMARY KEY(id)
  CONSTRAINT fk_role_id	FOREIGN KEY (role_id) REFERENCES role.(id)
);
 */
@Getter
@Setter
@Entity
@Table(name="user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    Integer id;

    @Column(name="name")
    String name;

    @Column(name="email")
    String email;

    @Column(name="password")
    String password;

    @Column(name="enable")
    Boolean enable;

    @ManyToOne
    @JoinColumn(name="role_id")
    Role role;

}