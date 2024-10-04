package com.fpc.chfs.churchfinancialsystem.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fpc.chfs.churchfinancialsystem.shared.dto.CommonResponseDTO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.fpc.chfs.churchfinancialsystem.auth.dto.AuthResponseDTO;

public class CHFSUtil {

    public static boolean stringIsNullOrEmpty(String string) {
        return string == null || string.trim().isEmpty();
    }

    public static Boolean stringToBoolean(String booleanString) {
        return Boolean.parseBoolean(booleanString);
    }

    public static Date stringToDate(String dateString) {
        try {
            if(stringIsNullOrEmpty(dateString)){
                return null;
            } else {
                return new SimpleDateFormat("dd/MM/yyyy").parse(dateString);
            }
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String objectToJSON(Object obj, Class<?> classToCast){
        return new GsonBuilder().create().toJson(obj, classToCast);
    }

}
