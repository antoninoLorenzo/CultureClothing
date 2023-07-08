package com.culture.controller.servlet.pages;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "catalogServlet", urlPatterns = "/products")
public class CatalogServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        //  XSS Vulnerability ...
        String gender = request.getParameter("gender");
        String category = request.getParameter("category");
        String brand = request.getParameter("brand");

        Cookie genderCookie = new Cookie("gender", gender);
        Cookie categoryCookie = new Cookie("category", category);
        Cookie brandCookie = new Cookie("brand", brand);
        Cookie pageCookie = new Cookie("page", "0");

        response.addCookie(genderCookie);
        response.addCookie(categoryCookie);
        response.addCookie(brandCookie);
        response.addCookie(pageCookie);

        getServletContext().getRequestDispatcher("/dist/catalog-page.jsp").forward(request, response);
    }
}
