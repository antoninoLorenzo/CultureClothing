package com.culture.controller.filter;

import com.culture.model.users.repository.UsersRepository;
import com.culture.utils.cookies.CookieUtils;
import jakarta.servlet.DispatcherType;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "adminFilter"
        , urlPatterns = {"/admin", "/admin/data"}
        , servletNames = {"adminPage", "adminDataServlet"}
        , dispatcherTypes = DispatcherType.REQUEST)
public class AdminFilter extends HttpFilter {
    private UsersRepository usersRepository;

    @Override
    public void init() throws ServletException {
        usersRepository = UsersRepository.getInstance();
    }

    @Override
    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("Admin Filter");
        Cookie uuidCookie = CookieUtils.searchCookie(request.getCookies(), "CC_UUID");

        if (uuidCookie != null) {
            //  verify uuid
            boolean isAdmin = usersRepository.isAdmin(uuidCookie.getValue());

            if (isAdmin) {
                //  valid uuid
                chain.doFilter(request, response);
            } else {
                //  send back to original page (referer)
                getServletContext().getRequestDispatcher("/dist/landing-page.jsp").forward(request, response);
            }
        } else {
            //  send back to login page
            getServletContext().getRequestDispatcher("/dist/login-page.jsp").forward(request, response);
        }
    }
}
