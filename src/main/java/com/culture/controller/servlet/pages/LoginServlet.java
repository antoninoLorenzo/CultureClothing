package com.culture.controller.servlet.pages;

import com.culture.utils.cookies.CookieUtils;
import com.culture.utils.cookies.SameSiteCookie;
import com.culture.model.users.repository.UsersRepository;
import com.culture.model.users.beans.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "loginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    private UsersRepository usersRepository;

    @Override
    public void init() throws ServletException {
        usersRepository = UsersRepository.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        //  Save URL to redirect after login
        //  Must check referer header
        String referer = request.getHeader("Referer");
        if (referer != null) {
            Cookie refererCookie = new Cookie("referer", referer);
            refererCookie.setMaxAge(300);  //5 mins
            refererCookie.setHttpOnly(true);
            response.addCookie(refererCookie);
        }

        getServletContext().getRequestDispatcher("/dist/login-page.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        Cookie refererCookie = CookieUtils.searchCookie(request.getCookies(), "referer");

        String redirect = (refererCookie == null || refererCookie.getValue() == null)
                ?"/landing-page"
                :refererCookie.getValue();

        if (refererCookie != null) {
            refererCookie.setMaxAge(0);
            response.addCookie(refererCookie);
        }

        //  Login user
        String email = request.getParameter("e-mail");
        String password = request.getParameter("password");

        //  Verify email is valid
        if(!UsersRepository.isValidEmail(email)) {
            //  + message
            getServletContext().getRequestDispatcher("/dist/login-page.jsp").forward(request, response);
        }

        Optional<Users> users = usersRepository.loginUser(email, password);

        if (users.isPresent()) {
            //  Fetch uuid from database
            String uuid = usersRepository.getUUID(users.get());
            SameSiteCookie uuidCookie = new SameSiteCookie("CC_UUID", uuid);

            uuidCookie.setSecure(false);
            uuidCookie.setHttpOnly(true);
            uuidCookie.setMaxAge(3600 * 24 * 7);
            uuidCookie.setSameSite("Lax");
            response.addCookie(uuidCookie);

            Cookie loggedCookie = new Cookie("lggd", "true");
            uuidCookie.setSecure(false);
            loggedCookie.setMaxAge(3600 * 24 * 7);
            response.addCookie(loggedCookie);

            response.sendRedirect(redirect);
        }
        else {
            getServletContext().getRequestDispatcher("/dist/login-page.jsp").forward(request, response);
        }
    }
}
