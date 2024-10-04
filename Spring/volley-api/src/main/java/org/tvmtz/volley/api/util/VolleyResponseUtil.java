package org.tvmtz.volley.api.util;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class VolleyResponseUtil {


    public static ResponseEntity<String> getResponseEntity(String responseMessage, HttpStatus httpStatus) {
        return new ResponseEntity<String>("{\"message\":\"" + responseMessage + "\"}", httpStatus);
    }
/*
    public static ResponseEntity<AuthResponseDTO> getResponseEntityJwt(ResponseType responseType, String title, String message, String token, HttpStatus httpStatus) {
        AuthResponseDTO jwtAuthenticationResponse = new AuthResponseDTO();
        jwtAuthenticationResponse.setResponseType(responseType.toString());
        jwtAuthenticationResponse.setResponseTitle(title);
        jwtAuthenticationResponse.setResponseMessage(message);
        jwtAuthenticationResponse.setToken(token);
        return new ResponseEntity<AuthResponseDTO>(jwtAuthenticationResponse, httpStatus);
    }
*/
    public static ResponseEntity<CommonResponseDTO> getCommonResponseEntity(ResponseType responseType, String title, String message, HttpStatus httpStatus) {
        CommonResponseDTO commonResponse = new CommonResponseDTO();
        commonResponse.setResponseType(responseType.toString());
        commonResponse.setResponseTitle(title);
        commonResponse.setResponseMessage(message);
        return new ResponseEntity<>(commonResponse, httpStatus);
    }

    public static ResponseEntity<CommonResponseDTO> getLengthErrorResponse(String element) {
        CommonResponseDTO commonResponse = new CommonResponseDTO();
        commonResponse.setResponseType(ResponseType.WARNING.toString());
        commonResponse.setResponseTitle(element + VolleyConstants.LENGTH_ERROR);
        commonResponse.setResponseMessage("");
        return new ResponseEntity<>(commonResponse, HttpStatus.NOT_FOUND);
    }

    public static ResponseEntity<CommonResponseDTO> getServerErrorResponse() {
        CommonResponseDTO commonResponse = new CommonResponseDTO();
        commonResponse.setResponseType(ResponseType.ERROR.toString());
        commonResponse.setResponseTitle(VolleyConstants.FATAL_ERROR);
        commonResponse.setResponseMessage(VolleyConstants.SOMETHING_WENT_WRONG);
        return new ResponseEntity<>(commonResponse, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    public static ResponseEntity<CommonResponseDTO> getDataMissingResponse() {
        CommonResponseDTO commonResponse = new CommonResponseDTO();
        commonResponse.setResponseType(ResponseType.ERROR.toString());
        commonResponse.setResponseTitle(VolleyConstants.MISSING_MANDATORY);
        commonResponse.setResponseMessage(VolleyConstants.MISSING_MANDATORY_MESSAGE);
        return new ResponseEntity<>(commonResponse, HttpStatus.BAD_REQUEST);
    }

    public static ResponseEntity<CommonResponseDTO> getNotFoundResponse(String element) {
        CommonResponseDTO commonResponse = new CommonResponseDTO();
        commonResponse.setResponseType(ResponseType.WARNING.toString());
        commonResponse.setResponseTitle(element + VolleyConstants.NOT_FOUND);
        commonResponse.setResponseMessage("");
        return new ResponseEntity<>(commonResponse, HttpStatus.NOT_FOUND);
    }

    public static ResponseEntity<CommonResponseDTO> getAlreadyExistsResponse(String element) {
        CommonResponseDTO commonResponse = new CommonResponseDTO();
        commonResponse.setResponseType(ResponseType.WARNING.toString());
        commonResponse.setResponseTitle(element + VolleyConstants.ALREADY_EXISTS);
        commonResponse.setResponseMessage("");
        return new ResponseEntity<>(commonResponse, HttpStatus.NOT_FOUND);
    }

    public static ResponseEntity<CommonResponseDTO> getSuccessResponse(String element, String action) {
        CommonResponseDTO commonResponse = new CommonResponseDTO();
        commonResponse.setResponseType(ResponseType.SUCCESS.toString());
        commonResponse.setResponseTitle(element + " successfully " + action);
        commonResponse.setResponseMessage("");
        return new ResponseEntity<>(commonResponse, HttpStatus.OK);
    }
}
