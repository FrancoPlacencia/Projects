package org.fp.ibaweb.Model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
/*
CREATE TABLE category (
	id INTEGER NOT NULL AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	description VARCHAR(250) NOT NULL,
	PRIMARY KEY (id)
);
 */
@Getter
@Setter
@Entity
@Table(name="category")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private Integer id;

    @Column(name="name")
    private String name;

    @Column(name="description")
    private String description;

    @Override
    public String toString(){
        return "Category [" + id + "," + name + "," + description + "]";
    }
}
