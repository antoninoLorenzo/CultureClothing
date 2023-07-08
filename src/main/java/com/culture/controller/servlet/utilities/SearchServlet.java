package com.culture.controller.servlet.utilities;

import com.culture.model.products.beans.Product;
import com.culture.model.products.beans.SingleImage;
import com.culture.model.products.repository.ImagesRepository;
import com.culture.model.products.repository.ProductsRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@WebServlet(name = "searchServlet", urlPatterns = "/search")
public class SearchServlet extends HttpServlet {
    private ProductsRepository productsRepository;
    private ImagesRepository imagesRepository;

    @Override
    public void init() throws ServletException {
        productsRepository = ProductsRepository.getInstance();
        imagesRepository = ImagesRepository.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");

        //  Retrieve product name from request
        System.out.println(request.getParameter("searching"));
        String input = request.getParameter("searching");

        System.out.println("Searched product: " + input);

        //  Search product in repository
        ObjectMapper mapper = new ObjectMapper();
        mapper.enable(SerializationFeature.INDENT_OUTPUT);
        try{
            List<Product> products =  productsRepository.getProductsByName(input);

            /*List<List<SingleImage>> images = products.stream()
                    .map(imagesRepository::getSingleProductImages)
                    .toList();

            Map<Product, List<SingleImage>> output = IntStream.range(0, products.size())
                    .boxed()
                    .collect(Collectors.toMap(products::get, images::get));*/

            Map<Product, List<SingleImage>> output = productsRepository.getProductsImages(products);

            if (output.isEmpty()) {
                System.out.println("No product found");
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            } else {
                System.out.println("Found: ");
                for (Product p : output.keySet())
                    System.out.println(p);

                //  Send data back as json
                String json = mapper.writeValueAsString(output);
                response.getWriter().write(json);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }

    }
}
