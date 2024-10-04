package com.fpc.chfs.churchfinancialsystem.fund;

import com.fpc.chfs.churchfinancialsystem.category.Category;
import com.fpc.chfs.churchfinancialsystem.church.Church;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="funds")
@DynamicUpdate
public class Fund {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="fund_id")
    private Integer fundId;

    @Column(name="name")
    private String name;

    @Column(name="description")
    private String description;

    @Column(name="created_on")
    private Date createdOn;
    @Column(name="created_by")
    private Integer createdBy;

    @Column(name="updated_on")
    private Date updatedOn;
    @Column(name="updated_by")
    private Integer updatedBy;


    @OneToMany(mappedBy = "fund")
    private Set<Category> categories = new HashSet<>();

    @Override
    public String toString() {
        String tab = "\t";
        String line = "\n";
        String objectName = "Fund";
        return objectName + " [" + line +
                tab + "fundId=" + this.fundId + ", " + line +
                tab + "name=" + this.name + ", " + line +
                tab + "description=" + this.description + ", " + line +
                tab + "createdOn=" + this.createdOn + ", " + line +
                tab + "createdBy=" + this.createdBy + ", " + line +
                tab + "updatedOn=" + this.updatedOn  + ", " + line +
                tab + "updatedBy=" + this.updatedBy + ", " + line +
                "]";
    }
}
