package com.fpc.chfs.churchfinancialsystem.church.dto;

import com.fpc.chfs.churchfinancialsystem.category.Category;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChurchDTO {
    private Integer churchId;

    private String name;

    private String denomination;

    private String address;

    private String registration;

    private List<Category> categories;
}
