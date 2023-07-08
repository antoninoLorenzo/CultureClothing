package com.culture.utils.cookies;

import jakarta.servlet.http.Cookie;
import lombok.Getter;
import lombok.Setter;

/**
 * Implements same site secuirty for cookies
 * */
@Setter
@Getter
public class SameSiteCookie extends Cookie {
    private String sameSite;
    public SameSiteCookie(String name, String value) {
        super(name, value);
    }
}
