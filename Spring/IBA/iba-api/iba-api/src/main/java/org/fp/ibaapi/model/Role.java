package org.fp.ibaapi.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/*
CREATE TABLE role (
	id INTEGER NOT NULL AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	description VARCHAR(250) NOT NULL,
	PRIMARY KEY (id)
);
 */
@Getter
@Setter
@Entity
@Table(name="role")
public class Role {

    @Id
    @Column(name="id")
    Integer id;

    @Column(name="name")
    String name;

    @Column(name="description")
    String description;

}
