package com.fpc.chfs.churchfinancialsystem.church.dto;


import com.fpc.chfs.churchfinancialsystem.category.Category;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;
import java.util.Set;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChurchResponseDTO {

    private Integer churchId;

    private String name;

    private String denomination;

    private String address;

    private String registration;

    private Set<Category> categories;
 }
