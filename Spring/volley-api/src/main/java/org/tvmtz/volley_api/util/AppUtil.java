package org.tvmtz.volley_api.util;

public class AppUtil {
    /**
     * Quick validation for String, to be used on DTO validations
     */
    public static boolean isNullOrEmptyString(String string) {
        return string == null || string.isEmpty();
    }

    /**
     * Quick validation for Integer, to be used on DTO validations
     */
    public static boolean isNullOrZeroOrLess(Integer integer) {
        return integer == null || integer <= 0;
    }
}
