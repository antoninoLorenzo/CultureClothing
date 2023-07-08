package com.culture.controller.servlet.pages;

import com.culture.model.products.beans.Product;
import com.culture.model.products.beans.SingleImage;
import com.culture.model.products.repository.ImagesRepository;
import com.culture.model.products.repository.ProductsRepository;
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
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@WebServlet(name = "productServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {

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

        //  Get requested product from request parameters
        String productName = request.getParameter("product_name");
        try {
            //  Retreive product from database
            List<Product> productList = productsRepository.getProductsByName(productName);

            //  Retrive images based on products
            Map<Product, List<SingleImage>> products = productsRepository.getProductsImages(productList);

            //  Send product page response
            ObjectMapper mapper = new ObjectMapper();
            mapper.enable(SerializationFeature.INDENT_OUTPUT);
            String json = mapper.writeValueAsString(products);
            request.setAttribute("productListJson", json);
        } catch (Exception e) {
            e.printStackTrace();
        }

        getServletContext()
                .getRequestDispatcher("/dist/product-page.jsp")
                .forward(request, response);
    }

    @Override
    public void destroy() {
        productsRepository.closeEntityManager();
        imagesRepository.closeEntityManager();
    }
}
