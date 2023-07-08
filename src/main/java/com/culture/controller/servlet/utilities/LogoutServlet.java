package com.culture.controller.servlet.utilities;

import com.culture.utils.cookies.CookieUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "logoutServlet", urlPatterns = "/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        //  Save previous location to redirect after logout
        String ref = request.getHeader("Referer");

        //  Delete UUID Cookie
        Cookie[] cookies = request.getCookies();

        Cookie uuid = CookieUtils.searchCookie(cookies, "CC_UUID");
        Cookie lggd = CookieUtils.searchCookie(cookies, "lggd");
        if (uuid!=null) {
            uuid.setMaxAge(0);
            response.addCookie(uuid);

            lggd.setMaxAge(0);
            response.addCookie(lggd);
        }

        if (ref.contains("admin"))
            response.sendRedirect("/");
        else
            response.sendRedirect(ref);
    }
}
