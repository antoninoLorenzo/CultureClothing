package com.culture.controller.servlet.utilities;

import com.culture.utils.cookies.SameSiteCookie;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "cookie-servlet", urlPatterns = "/cookies")
public class CookieServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accepted = request.getParameter("cookies");
        SameSiteCookie acceptedCookie;
        List<Cookie> cookies = new ArrayList<>();

        if (accepted.equals("true")){
            //  Add Accepted Cookies
            acceptedCookie = new SameSiteCookie("accepted_cookies", "true");
            acceptedCookie.setSecure(false);
            acceptedCookie.setMaxAge(3600 * 24 * 7);
            acceptedCookie.setSameSite("Lax");

            cookies.add(acceptedCookie);
        } else if (accepted.equals("false")) {
            //  Add Essential Cookies
            acceptedCookie = new SameSiteCookie("accepted_cookies", "false");
            acceptedCookie.setSecure(false);
            acceptedCookie.setMaxAge(3600 * 24 * 7);
            acceptedCookie.setSameSite("Lax");

            cookies.add(acceptedCookie);
        }

        for (Cookie c : cookies)
            response.addCookie(c);
    }
}
