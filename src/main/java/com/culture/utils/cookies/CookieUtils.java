package com.culture.utils.cookies;

import jakarta.servlet.http.Cookie;

import java.util.Arrays;

public class CookieUtils {
    /**
     * Find cookie in array
     * @param cookies: cookies from request
     * @param name: cookie to find
     * @return Cookie or null
     * */
    public static Cookie searchCookie(Cookie[] cookies, String name) {
        return Arrays.stream(cookies)
                .filter(cookie -> cookie.getName().equals(name))
                .findFirst()
                .orElse(null);
    }
}
