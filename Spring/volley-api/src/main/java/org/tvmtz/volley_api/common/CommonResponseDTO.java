package org.tvmtz.volley_api.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * Common Response for API Calls, this will encapsulate the response, any other response should extend from this class to reuse the common response
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommonResponseDTO {
    /**
     * Type of the response: To identify the type of response
     *
     * @see ResponseType
     */
    private String type;

    /**
     * Title of the response: To be presented to the user
     */
    private String title;

    /**
     * Message of the response: The data requested by the user
     */
    private List<?> message;

}
