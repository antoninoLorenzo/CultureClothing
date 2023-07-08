package com.culture.controller.servlet.utilities;

import java.io.*;

import com.github.nbaars.pwnedpasswords4j.client.PwnedPasswordChecker;
import com.github.nbaars.pwnedpasswords4j.client.PwnedPasswordClient;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import okhttp3.OkHttpClient;

@WebServlet(name = "pwnedPasswordServlet", value = "/pwned-password-check")
public class PwnedPasswordServlet extends HttpServlet {
    private PwnedPasswordChecker checker;

    public void init() {
        PwnedPasswordClient client = new PwnedPasswordClient(new OkHttpClient(), "https://api.pwnedpasswords.com/range", "");
        checker = new PwnedPasswordChecker(client);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        String password = request.getParameter("password");
        boolean result = checker.check(password);
        String out = "";
        if (result) {
            out = out.concat("invalid");
        } else {
            out = out.concat("valid");
        }
        response.getWriter().write(out);
    }
}