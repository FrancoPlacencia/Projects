package org.tvmtz.volley.api.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommonResponseDTO {

    private String responseType;
    private String responseTitle;
    private String responseMessage;
}
