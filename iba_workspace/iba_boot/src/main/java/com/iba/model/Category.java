package com.iba.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.UniqueElements;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "CATEGORY")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "CATEGORY_ID", nullable = false)
    private int id;

    @Column(name = "CATEGORY_NAME", nullable = false, unique=true)
    @NotEmpty(message = "*Please provide category name")
    private String categoryName;

    @Column(name = "CATEGORY_DESCRIPTION", nullable = false)
    @NotEmpty(message = "*Please provide category description")
    private String description;

}
