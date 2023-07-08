package OrderTesting;

import com.culture.model.orders.beans.Address;
import com.culture.model.orders.beans.Order;
import com.culture.model.orders.beans.OrderItem;
import com.culture.model.orders.repository.OrderRepository;
import com.culture.model.payment.beans.Payment;
import com.culture.model.payment.repository.PaymentRepository;
import com.culture.model.products.beans.Product;
import com.culture.model.products.repository.ProductsRepository;
import com.culture.model.users.beans.Users;
import com.culture.model.users.repository.UsersRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

public class OrderRepositoryTest {
    @Test
    public void test_addAddress() {
        OrderRepository orderRepository = OrderRepository.getInstance();

        Assertions.assertTrue(
                orderRepository.addAddress(
                        "Via Piave 18"
                        , "Avellino"
                        , "Campania"
                        , "83100"
                        , "IT").isPresent()
        );
    }

    @Test
    public void test_addOrder() {
        UsersRepository usersRepository = UsersRepository.getInstance();
        PaymentRepository paymentRepository = PaymentRepository.getInstance();
        OrderRepository orderRepository = OrderRepository.getInstance();

        Optional<Users> opt_user = usersRepository.loginUser(
                "antonino.lorenzo02@gmail.com"
                , "Antonino.lorenzo02"
        );

        Optional<Payment> opt_payment = paymentRepository.addPaymentMethod(
                "1234567891234567"
                , new Date(2024, Calendar.MAY, 1)
                ,"mastercard"
                ,"credit card");

        Optional<Address> opt_address = orderRepository.addAddress(
                "Via Piave 18"
                , "Avellino"
                , "Campania"
                , "83100"
                , "IT");

        Assertions.assertTrue(
                opt_user.isPresent() && opt_payment.isPresent() && opt_address.isPresent()
        );

        Assertions.assertTrue(
                orderRepository.addOrder(
                        opt_user.get()
                        , opt_payment.get()
                        ,opt_address.get()
                        , new Date()
                        ,new BigDecimal("215.5")
                        ,"ordered"
                        ,"standard delivery").isPresent()
        );
    }

    @Test
    public void test_addOrderItems() {
        ProductsRepository productsRepository = ProductsRepository.getInstance();
        OrderRepository orderRepository = OrderRepository.getInstance();

        Optional<Order> order = orderRepository.getOrder(1);
        Assertions.assertTrue(order.isPresent());

        Product product = productsRepository.getProductById("1");
        Assertions.assertNotNull(product);

        Assertions.assertTrue(
                orderRepository.addOrderItem(order.get(), product, 1).isPresent()
        );
    }

    @Test
    public void test_getOrderById() {
        OrderRepository orderRepository = OrderRepository.getInstance();

        Assertions.assertTrue(
                orderRepository.getOrder(1).isPresent()
        );
    }

    @Test
    public void test_getOrderByUser() {
        UsersRepository usersRepository = UsersRepository.getInstance();
        OrderRepository orderRepository = OrderRepository.getInstance();

        Optional<Users> opt_user = usersRepository.loginUser(
                "antonino.lorenzo02@gmail.com"
                , "Antonino.lorenzo02"
        );

        Assertions.assertTrue(opt_user.isPresent());

        Optional<List<Order>> opt_orders = orderRepository.getOrders(opt_user.get());

        Assertions.assertTrue(opt_orders.isPresent());
    }

    @Test
    public void test_getSalesNumber() {
        OrderRepository orderRepository = OrderRepository.getInstance();
        long result = orderRepository.getSalesNumber();
        System.out.println("Result: " + result);
    }

    @Test
    public void test_getSalesRevenue() {
        OrderRepository orderRepository = OrderRepository.getInstance();
        BigDecimal result = orderRepository.getSalesRevenue();
        System.out.println("Result: " + result);
    }

    @Test
    public void test_getMostOrdered() {
        OrderRepository orderRepository = OrderRepository.getInstance();
        List<Product> result = orderRepository.getMostOrdered();
        System.out.println("Result: ");
        for(Product l : result)
            System.out.println(l + " ");
    }
}
