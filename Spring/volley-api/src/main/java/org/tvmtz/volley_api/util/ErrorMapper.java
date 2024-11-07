package org.tvmtz.volley_api.util;

import org.springframework.stereotype.Component;
import org.tvmtz.volley_api.common.ResponseType;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Component
public class ErrorMapper {

    /**
     * Creates map with key: "message" and value: exception's message.
     *
     * @param e - the thrown exception
     * @return the created map
     */
    public Map<String, String> createErrorMap(Throwable e) {
        Map<String, String> errorMsg = new HashMap<>();
        errorMsg.put("type", ResponseType.ERROR.toString());
        errorMsg.put("message", e.getMessage());

        return errorMsg;
    }

    public Map<String, List<String>> createErrorMap(List<String> messages) {
        Map<String, List<String>> errorMsg = new HashMap<>();
        errorMsg.put("errors", messages);
        return errorMsg;
    }
}
