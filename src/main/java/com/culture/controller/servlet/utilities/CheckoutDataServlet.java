package com.culture.controller.servlet.utilities;

import com.culture.exceptions.OrderFailedException;
import com.culture.model.orders.beans.Address;
import com.culture.model.orders.beans.Order;
import com.culture.model.orders.beans.OrderItem;
import com.culture.model.orders.repository.OrderRepository;
import com.culture.model.payment.beans.Payment;
import com.culture.model.payment.repository.PaymentRepository;
import com.culture.model.products.beans.Product;
import com.culture.model.products.beans.SingleImage;
import com.culture.model.products.repository.ImagesRepository;
import com.culture.model.products.repository.ProductsRepository;
import com.culture.model.users.beans.Users;
import com.culture.model.users.repository.UsersRepository;
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
import java.math.BigDecimal;
import java.security.InvalidParameterException;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@WebServlet(name = "checkoutDataServlet", urlPatterns = "/checkout/data")
public class CheckoutDataServlet extends HttpServlet {
    private ProductsRepository productsRepository;
    private ImagesRepository imagesRepository;
    private OrderRepository orderRepository;
    private PaymentRepository paymentRepository;
    private UsersRepository usersRepository;

    @Override
    public void init() throws ServletException {
        productsRepository = ProductsRepository.getInstance();
        imagesRepository = ImagesRepository.getInstance();
        orderRepository = OrderRepository.getInstance();
        paymentRepository = PaymentRepository.getInstance();
        usersRepository = UsersRepository.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");

        //  Instead of taking "arbitrary input" from $.get servlet
        //  could fetch ids from cookies
        String ids = request.getParameter("products");
        String[] requested_product_ids = ids.split("_");

        ObjectMapper mapper = new ObjectMapper();
        mapper.enable(SerializationFeature.INDENT_OUTPUT);

        try {
            //  Fetch products
            List<Product> requested_products = new ArrayList<>();
            for (String id : requested_product_ids)
                requested_products.add(
                        productsRepository.getProductById(id)
                );

            //  Fetch product images
            List<List<SingleImage>> images = requested_products.stream()
                    .map(imagesRepository::getSingleProductImages)
                    .toList();

            //  Link images to products
            Map<Product, List<SingleImage>> products = IntStream.range(0, requested_products.size())
                    .boxed()
                    .collect(Collectors.toMap(requested_products::get, images::get));

            //  Send response
            String json = mapper
                    .writeValueAsString(products);
            response.getWriter().write(json);

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String address = request.getParameter("address");
        String cap = request.getParameter("cap");
        String delivery_type = request.getParameter("delivery_type");
        String card_number = request.getParameter("card_number");
        String expiring_date = request.getParameter("expiring_date");
        String provider = request.getParameter("provider");
        String final_price = request.getParameter("final_price");
        String[] ids;

        Cookie[] cookies = request.getCookies();

        //  Parse date
        Date expiring = new Date();
        try {
            // Parse the month and year separately
            String[] dateParts = expiring_date.split("/");
            int month = Integer.parseInt(dateParts[0]);
            int year = Integer.parseInt(dateParts[1]);

            // Set the day to 1 and create the Date object
            Calendar calendar = Calendar.getInstance();
            calendar.set(year, month - 1, 1);
            expiring = calendar.getTime();
        } catch (NumberFormatException | ArrayIndexOutOfBoundsException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }


        try {
            //  Get Product ids
            Cookie cart = CookieUtils.searchCookie(cookies, "cart");
            if (cart != null) {
                ids = cart.getValue().split("_");

                //  Check if user is logged
                Cookie uuid = CookieUtils.searchCookie(cookies, "CC_UUID");
                Users user = null;
                if (uuid != null) {
                    //  fetch user
                    Optional<Users> opt_user = usersRepository.findByUUID(uuid.getValue());
                    if (opt_user.isPresent())
                        user = opt_user.get();
                }

                //  Add payment method
                Optional<Payment> opt_payment = paymentRepository.addPaymentMethod(
                        card_number
                        , expiring
                        , provider
                        , "credit card");

                //  Add address to database
                Optional<Address> opt_addr = orderRepository.addAddress(address, city, state, cap, country);

                if (opt_payment.isPresent() && opt_addr.isPresent()) {
                    //  Add order to database
                    Optional<Order> opt_order = orderRepository.addOrder(
                            user
                            , opt_payment.get()
                            , opt_addr.get()
                            , new Date()
                            , new BigDecimal(final_price)
                            , "ordered"
                            , delivery_type
                    );

                    if (opt_order.isPresent()) {
                        //  Fetch products
                        List<Product> products = new ArrayList<>();
                        for (String id : ids)
                            products.add(
                                    productsRepository.getProductById(id)
                            );

                        Order order = opt_order.get();
                        List<Optional<OrderItem>> opt_items = new ArrayList<>();
                        for (Product p : products)
                            opt_items.add(
                                    orderRepository.addOrderItem(order, p, 1)
                            );

                        //  Check if all order items got added
                        boolean valid = true;
                        for (Optional<OrderItem> item : opt_items)
                            if (item.isEmpty()) {
                                valid = false;
                                break;
                            }

                        if (valid) {
                            cart.setMaxAge(0);
                            response.addCookie(cart);

                            response.setStatus(HttpServletResponse.SC_OK);
                        }
                        else
                            throw new OrderFailedException("[CheckoutDataServlet]: Failed adding OrderItem to Order");
                    } else
                        throw new OrderFailedException("[CheckoutDataServlet]: Failed adding Order");
                } else
                    throw new InvalidParameterException("[CheckoutDataServlet]: Invalid Payment or Address");
            } else
                throw new InvalidParameterException("[CheckoutDataServlet]: Invalid Product Ids");

        } catch (InvalidParameterException inv) {
            getServletContext().getRequestDispatcher("/dist/cart-page.jsp").forward(request, response);

        } catch (Exception ex) {
            //  should be 500
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            //  maybe retry persisting order
        }
    }
}
