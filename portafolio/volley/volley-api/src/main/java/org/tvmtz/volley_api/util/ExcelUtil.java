package org.tvmtz.volley_api.util;

import org.springframework.beans.factory.annotation.Value;

public class ExcelUtil {

    // @Value("${app.content-type}")
    private static String CONTENT_TYPE = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

    public static boolean hasExcelFormat(String contentType) {
        return CONTENT_TYPE.equals(contentType);
    }

    public static void excelRead() {

    }


}
