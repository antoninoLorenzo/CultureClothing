package com.culture.controller.servlet.utilities;

import com.culture.model.cart.repository.CartRepository;
import com.culture.model.users.beans.Users;
import com.culture.model.users.repository.UsersRepository;
import com.culture.utils.cookies.CookieUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;
import java.util.Optional;

@WebServlet(name = "addToCart", urlPatterns = "/add_to_cart")
public class AddCartServlet extends HttpServlet {
    private UsersRepository usersRepository;
    private CartRepository cartRepository;

    @Override
    public void init() throws ServletException {
        usersRepository = UsersRepository.getInstance();
        cartRepository = CartRepository.getInstance();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //  Get product parameter
        String p_id = request.getParameter("product");

        //  Create empty string
        String cookieValue = "";

        //  Verify if 'cart' cookie exists
        //  Yes: concat product id to string
        //  No: create 'cart' cookie and set value
        Cookie cartCookie = CookieUtils.searchCookie(request.getCookies(), "cart");
        if (cartCookie != null) {
            //  Add product id only if it isn't already in value
            if (!Arrays.asList(cartCookie
                            .getValue()
                            .split("_"))
                    .contains(p_id)
            ) {
                cookieValue = cartCookie.getValue().concat("_"+p_id);
                cartCookie.setValue(cookieValue);
            }
        } else {
            cookieValue = cookieValue.concat(p_id);
            cartCookie = new Cookie("cart", cookieValue);
        }

        //  Verify if user is logged
        Cookie uuid = CookieUtils.searchCookie(request.getCookies(), "CC_UUID");
        Users user;

        if (uuid != null) {
            Optional<Users> opt_user = usersRepository.findByUUID(uuid.getValue());

            if (opt_user.isPresent()) {
                user = opt_user.get();
                cartRepository.addItemToCart(user, p_id);
            }
        }

        //  Send cookie as response
        cartCookie.setMaxAge(60*60*24*7);   // week

        if (cartCookie.getValue().startsWith("_"))
            cartCookie.setValue(
                    cartCookie.getValue().substring(1)
            );

        response.addCookie(cartCookie);
    }
}
