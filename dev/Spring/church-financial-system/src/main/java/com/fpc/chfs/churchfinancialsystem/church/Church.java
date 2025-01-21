package com.fpc.chfs.churchfinancialsystem.church;

import com.fpc.chfs.churchfinancialsystem.category.Category;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;

import java.util.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "churches")
@DynamicUpdate
public class Church {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "church_id")
    private Integer churchId;

    @Column(name = "name")
    private String name;

    @Column(name = "denomination")
    private String denomination;

    @Column(name = "address")
    private String address;

    @Column(name = "registration")
    private String registration;

    @Column(name = "created_on")
    private Date createdOn;
    @Column(name = "created_by")
    private Integer createdBy;

    @Column(name = "updated_on")
    private Date updatedOn;
    @Column(name = "updated_by")
    private Integer updatedBy;


    @OneToMany(
        mappedBy = "church",
        fetch=FetchType.EAGER
    )
    private Set<Category> categories = new HashSet<>();
    /*
    @ManyToMany(
            fetch = FetchType.LAZY
    )
    @JoinTable(
            name = "church_categories",
            joinColumns = @JoinColumn(name = "church_id"),
            inverseJoinColumns = @JoinColumn(name = "category_id")
    )
    private Set<Category> categories = new HashSet<>();
*/

    @Override
    public String toString() {
        String tab = "\t";
        String line = "\n";
        String objectName = "Church";
        StringBuilder retVal;
        retVal = new StringBuilder(line + objectName + " [" +
                tab + "churchId=" + this.churchId + ", " + line +
                tab + "name=" + this.name + ", " + line +
                tab + "denomination=" + this.denomination + ", " + line +
                tab + "address=" + this.address + ", " + line +
                tab + "registration=" + this.registration + ", " + line +
                tab + "createdOn=" + this.createdOn + ", " + line +
                tab + "createdBy=" + this.createdBy + ", " + line +
                tab + "updatedOn=" + this.updatedOn + ", " + line +
                tab + "updatedBy=" + this.updatedBy + ", " + line +
                tab + "categories={");
        retVal.append("}]");
        return retVal.toString();

    }
}
