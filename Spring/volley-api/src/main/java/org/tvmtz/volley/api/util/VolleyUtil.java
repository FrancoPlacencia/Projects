package org.tvmtz.volley.api.util;

public class VolleyUtil {

    public static boolean isNullOrEmptyString(String string) {
        return string == null || string.isEmpty();
    }

    public static boolean isNullOrZeroOrLess(Integer integer) {
        return integer == null || integer <= 0;
    }
}
