package com.fpc.chfs.churchfinancialsystem.category.dto;

import com.fpc.chfs.churchfinancialsystem.church.Church;
import com.fpc.chfs.churchfinancialsystem.fund.Fund;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CategoryDTO {
    private Integer id;
    private String name;
    private String description;

    private Fund fund;
    private Church church;
}
