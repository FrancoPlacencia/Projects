package com.fpc.chfs.churchfinancialsystem.fund.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FundDTO {
    private Integer fundId;
    private String name;
    private String description;
}
