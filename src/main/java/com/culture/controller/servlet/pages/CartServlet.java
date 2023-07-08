package com.culture.controller.servlet.pages;

import com.culture.model.products.beans.Product;
import com.culture.model.products.beans.SingleImage;
import com.culture.model.products.repository.ImagesRepository;
import com.culture.model.products.repository.ProductsRepository;
import com.culture.utils.cookies.CookieUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@WebServlet(name = "cartPage", urlPatterns = "/cart")
public class CartServlet extends HttpServlet {

    private ProductsRepository productsRepository;
    private ImagesRepository imagesRepository;

    @Override
    public void init() throws ServletException {
        productsRepository = ProductsRepository.getInstance();
        imagesRepository = ImagesRepository.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        //  Retrieve product ids in cart cookie
        String[] productIDs = new String[0];
        try {
            productIDs = CookieUtils
                    .searchCookie(request.getCookies(), "cart")
                    .getValue()
                    .split("_");

            //  Cart cookie exists and products can be fetched
            try {
                //  Retrieve products corresponding to requested ids
                List<Product> cartProducts = new ArrayList<>();
                Arrays.stream(productIDs)
                        .forEach(id -> {
                            Product p = productsRepository.getProductById(id);
                            if (p != null)
                                cartProducts.add(p);
                        });

                //  Retrieve images based on products
                Map<Product, List<SingleImage>> products = productsRepository.getProductsImages(cartProducts);

                //  Add products to request, then they can be fetched by jsp
                ObjectMapper mapper = new ObjectMapper();
                mapper.enable(SerializationFeature.INDENT_OUTPUT);
                String json = mapper.writeValueAsString(products);
                request.setAttribute("productListJson", json);

            } catch (Exception e) {
                e.printStackTrace();
            }

        } catch (NullPointerException e) {
            //  Cart cookie doesn't exists
            response.addCookie(new Cookie("cart", ""));
        }



        getServletContext().getRequestDispatcher("/dist/cart-page.jsp").forward(request, response);
    }
}
