package com.culture.controller.servlet.pages;

import com.culture.utils.cookies.CookieUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "checkoutPageServlet", urlPatterns = "/checkout")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        Cookie reg = CookieUtils.searchCookie(request.getCookies(), "CC_UUID");
        boolean isLogged = false;
        try {
            String value = reg.getValue();
            if (value != null && !value.isEmpty() && !value.isBlank())
                isLogged = true;
        } catch (NullPointerException ex) {
            //
        }

        if (isLogged)
            getServletContext().getRequestDispatcher("/dist/checkout.jsp").forward(request, response);
        else {
            getServletContext().getRequestDispatcher("/dist/register-page.jsp").forward(request, response);
        }
    }

}
