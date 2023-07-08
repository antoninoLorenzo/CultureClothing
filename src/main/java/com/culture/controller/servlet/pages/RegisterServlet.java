package com.culture.controller.servlet.pages;

import com.culture.utils.cookies.CookieUtils;
import com.culture.utils.cookies.SameSiteCookie;
import com.culture.model.users.repository.UsersDataRepository;
import com.culture.model.users.repository.UsersRepository;
import com.culture.model.users.beans.Users;
import com.culture.model.users.beans.UsersData;
import com.culture.utils.id.SecureRandomUUID;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "registerServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    private UsersRepository usersRepository;
    private UsersDataRepository usersDataRepository;

    @Override
    public void init() throws ServletException {
        usersRepository = UsersRepository.getInstance();
        usersDataRepository = new UsersDataRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        //  Save URL to redirect after register
        //   must check the header referer
        String referer = request.getHeader("Referer");
        if (referer != null) {
            Cookie refererCookie = new Cookie("referer", referer);
            refererCookie.setMaxAge(300);  //5 mins
            refererCookie.setHttpOnly(true);
            response.addCookie(refererCookie);
        }

        getServletContext().getRequestDispatcher("/dist/register-page.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        //  Get referer and cleanup
        Cookie refererCookie = CookieUtils.searchCookie(request.getCookies(), "referer");
        String redirect = (refererCookie == null || refererCookie.getValue() == null)
                ?"/landing-page"
                :refererCookie.getValue();

        assert refererCookie != null;
        refererCookie.setMaxAge(0);
        response.addCookie(refererCookie);

        //  Get values from client
        String name, surname, birth, gender, email, password;
        name = request.getParameter("first-name");
        surname = request.getParameter("last-name");
        birth = request.getParameter("birthday");
        gender = request.getParameter("gender");    // ???
        email = request.getParameter("e-mail");
        password = request.getParameter("password");


        //  Verify email is valid
        if(!UsersRepository.isValidEmail(email)) {
            //  + message
            getServletContext().getRequestDispatcher("/dist/register-page.jsp").forward(request, response);
        }

        //  Create birthdate
        Date birthDate = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            birthDate  = dateFormat.parse(birth);
        } catch (ParseException e) {
            //  date is null
        }

        //  Hash password and generate UUID
        String hashed_password = BCrypt.hashpw(password, BCrypt.gensalt());
        String uuid = SecureRandomUUID.generateUUID().toString();

        //  Persist user in database
        Users newUser = new Users(email, hashed_password, uuid);
        UsersData usersData = new UsersData(newUser, name, surname, birthDate, gender);

        boolean register = usersRepository.registerUser(newUser);
        boolean addData = usersDataRepository.registerUserData(usersData);

        if (register){
            SameSiteCookie uuidCookie = new SameSiteCookie("CC_UUID", uuid);

            uuidCookie.setSecure(false);
            uuidCookie.setMaxAge(3600 * 24 * 7);
            uuidCookie.setSameSite("Lax");
            response.addCookie(uuidCookie);

            Cookie loggedCookie = new Cookie("lggd", "true");
            uuidCookie.setSecure(false);
            loggedCookie.setMaxAge(3600 * 24 * 7);
            response.addCookie(loggedCookie);

            response.sendRedirect(redirect);
        } else {
            getServletContext().getRequestDispatcher("/dist/register-page.jsp").forward(request, response);
        }
    }
}
