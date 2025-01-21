package com.fpc.chfs.churchfinancialsystem.church.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChurchOptionResponseDTO {
    private Integer churchId;
    private String name;
}
