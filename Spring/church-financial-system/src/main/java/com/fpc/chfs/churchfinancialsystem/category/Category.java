package com.fpc.chfs.churchfinancialsystem.category;

import com.fpc.chfs.churchfinancialsystem.church.Church;
import com.fpc.chfs.churchfinancialsystem.church.ChurchCategories;
import com.fpc.chfs.churchfinancialsystem.fund.Fund;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "categories")
@DynamicUpdate
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id")
    private Integer categoryId;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "created_on")
    private Date createdOn;
    @Column(name = "created_by")
    private Integer createdBy;

    @Column(name = "updated_on")
    private Date updatedOn;
    @Column(name = "updated_by")
    private Integer updatedBy;

/*
    MANY TO MANY EXAMPLE

    @ManyToMany(
            fetch = FetchType.LAZY
    )
    @JoinTable(
            name = "church_categories",
            joinColumns = @JoinColumn(name = "category_id"),
            inverseJoinColumns = @JoinColumn(name = "church_id")
    )
    private Set<Church> churches = new HashSet<>();
*/

    @ManyToOne
    @JoinColumn(name = "church_id")
    private Church church;


    @ManyToOne
    @JoinColumn(name = "fund_id")
    private Fund fund;

}
