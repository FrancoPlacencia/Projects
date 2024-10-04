package com.fp.jeopardyapi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name="category")
public class Category {

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "category_id")
    private Integer categoryId;

    @Column(name = "description")
    private String description;

    @Column(name = "game_id")
    private Integer gameId;
        
    @Column(name = "category_number")
    private Integer categoryNumber;
    
    @Override
    public String toString() {
        return "Category [" + 
        		this.categoryId + "," +
                this.description + "," +
                this.gameId + "," +
                this.categoryNumber + 
                "]";
    }

}
