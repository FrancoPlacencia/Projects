package org.tvmtz.volley_api.util;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.tvmtz.volley_api.common.CommonResponseDTO;
import org.tvmtz.volley_api.common.ResponseType;

import java.util.ArrayList;
import java.util.List;

/**
 * Generate the Response for all the API calls
 */
public class AppResponseUtil {
    public static ResponseEntity<String> getResponseEntity(String responseMessage, HttpStatus httpStatus) {
        return new ResponseEntity<String>("{\"message\":\"" + responseMessage + "\"}", httpStatus);
    }

    /*
        public static ResponseEntity<AuthResponseDTO> getResponseEntityJwt(ResponseType responseType, String title, String message, String token, HttpStatus httpStatus) {
            AuthResponseDTO jwtAuthenticationResponse = new AuthResponseDTO();
            jwtAuthenticationResponse.setType(responseType.toString());
            jwtAuthenticationResponse.setTitle(title);
            jwtAuthenticationResponse.setMessage(message);
            jwtAuthenticationResponse.setToken(token);
            return new ResponseEntity<AuthResponseDTO>(jwtAuthenticationResponse, httpStatus);
        }
    */
    public static ResponseEntity<CommonResponseDTO> getCommonResponseEntity(ResponseType responseType, String title, String message, HttpStatus httpStatus) {
        CommonResponseDTO commonResponse = new CommonResponseDTO();
        commonResponse.setType(responseType.toString());
        commonResponse.setTitle(title);
        commonResponse.setMessage(getListMessage(message));
        return new ResponseEntity<>(commonResponse, httpStatus);
    }

    public static CommonResponseDTO getLengthErrorResponse(String element) {
        CommonResponseDTO commonResponse = new CommonResponseDTO();
        commonResponse.setType(ResponseType.WARNING.toString());
        commonResponse.setTitle(element + AppConstants.LENGTH_ERROR);
        return commonResponse;
    }

    public static ResponseEntity<CommonResponseDTO> serverErrorResponse() {
        CommonResponseDTO commonResponse = new CommonResponseDTO();
        commonResponse.setType(ResponseType.ERROR.toString());
        commonResponse.setTitle(AppConstants.FATAL_ERROR);
        commonResponse.setMessage(getListMessage(AppConstants.SOMETHING_WENT_WRONG));
        return new ResponseEntity<>(commonResponse, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    public static CommonResponseDTO dataMissingResponse() {
        CommonResponseDTO commonResponse = new CommonResponseDTO();
        commonResponse.setType(ResponseType.ERROR.toString());
        commonResponse.setTitle(AppConstants.MISSING_MANDATORY);
        commonResponse.setMessage(getListMessage(AppConstants.MISSING_MANDATORY_MESSAGE));
        return commonResponse;
    }

    public static CommonResponseDTO notFoundResponse(String element) {
        CommonResponseDTO commonResponse = new CommonResponseDTO();
        commonResponse.setType(ResponseType.WARNING.toString());
        commonResponse.setTitle(element + " " + AppConstants.NOT_FOUND);
        return commonResponse;
    }

    public static CommonResponseDTO alreadyExistsResponse(String element) {
        CommonResponseDTO commonResponse = new CommonResponseDTO();
        commonResponse.setType(ResponseType.WARNING.toString());
        commonResponse.setTitle(element + AppConstants.ALREADY_EXISTS);
        return commonResponse;
    }

    public static CommonResponseDTO successResponse(String element, String action) {
        CommonResponseDTO commonResponse = new CommonResponseDTO();
        commonResponse.setType(ResponseType.SUCCESS.toString());
        commonResponse.setTitle(element + " successfully " + action);
        return commonResponse;
    }

    public static CommonResponseDTO badRequest(String element) {
        CommonResponseDTO commonResponseDTO = new CommonResponseDTO();
        commonResponseDTO.setType(ResponseType.WARNING.toString());
        commonResponseDTO.setTitle(element + " " + AppConstants.BAD_REQUEST);
        return commonResponseDTO;
    }

    private static List<String> getListMessage(String message) {
        List<String> messageList = new ArrayList<>();
        messageList.add(message);
        return messageList;
    }
}
