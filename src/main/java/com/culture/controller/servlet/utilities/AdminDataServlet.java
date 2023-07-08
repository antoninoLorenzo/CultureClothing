package com.culture.controller.servlet.utilities;

import com.culture.model.orders.repository.OrderRepository;
import com.culture.model.products.beans.Product;
import com.culture.model.products.repository.ProductsRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "adminDataServlet", urlPatterns = "/admin/data")
public class AdminDataServlet extends HttpServlet {
    private OrderRepository orderRepository;

    @Override
    public void init() throws ServletException {
        orderRepository = OrderRepository.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");

        //  Fetch performance data
        int visitors = (int) getServletContext().getAttribute("visit-count");
        long sales = orderRepository.getSalesNumber();
        BigDecimal revenue = orderRepository.getSalesRevenue();
        List<Product> most_ordered = orderRepository.getMostOrdered();

        //  Create performance object
        Map<String, Object> website_performances = new HashMap<>();

        website_performances.put("visitors", visitors);
        website_performances.put("sales", sales);
        website_performances.put("revenue", revenue);
        website_performances.put("most_ordered", most_ordered);

        //  Write JSON to response
        ObjectMapper mapper = new ObjectMapper();
        mapper.enable(SerializationFeature.INDENT_OUTPUT);
        String json = mapper
                .writeValueAsString(website_performances);
        response.getWriter().write(json);
    }
}
