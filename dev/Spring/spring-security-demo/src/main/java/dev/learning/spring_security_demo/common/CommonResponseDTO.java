package dev.learning.spring_security_demo.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.util.List;

/**
 * This object it's used to provide more information to the client side:
 * <ul>
 *     <li>type: Group the type of the response, using the <code>ResponseType</code> enum.</li>
 *     <li>message: Main response of the request.</li>
 *     <li>details: A list of more detailed information about the response.</li>
 * </ul>
 */
@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class CommonResponseDTO {
    private String type;
    private String message;
    private List<String> details;
}
