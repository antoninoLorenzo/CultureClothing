package com.culture.model.orders.repository;

import com.culture.model.Repository;
import com.culture.model.orders.beans.*;
import com.culture.model.payment.beans.Payment;
import com.culture.model.products.beans.Product;
import com.culture.model.users.beans.Users;
import jakarta.persistence.NoResultException;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

public class OrderRepository extends Repository {
    private static OrderRepository instance;
    private OrderRepository() {
        super();
    }

    public static synchronized OrderRepository getInstance() {
        if (instance == null)
            instance = new OrderRepository();

        return instance;
    }

    /**
     * Add an order to the database
     * */
    public Optional<Order> addOrder(Users user, Payment payment, Address address, Date purchase_date,
                                    BigDecimal total_price, String status_name, String delivery_type) {

        //  Fetch StatusType
        StatusType status;
        Optional<StatusType> opt_status = getStatusType(status_name);
        if (opt_status.isPresent()) {
            status = opt_status.get();
        }
        else
            throw new NullPointerException("Following status doesn't exists: " + status_name);

        //  Fetch DeliveryType
        DeliveryType type;
        Optional<DeliveryType> opt_type = getDeliveryType(delivery_type);
        if (opt_type.isPresent()) {
            type = opt_type.get();
        }
        else
            throw new NullPointerException("Following delivery type doesn't exists: " + delivery_type);

        //  Create Order
        Order order = new Order(user, payment, address, purchase_date, total_price, status, type);

        //  Persist
        try {
            em.getTransaction().begin();
            em.persist(order);
            em.flush();
            em.getTransaction().commit();
        } catch (Exception ex) {
            return Optional.empty();
        }

        return Optional.of(order);
    }

    /**
     *
     * */
    public Optional<OrderItem> addOrderItem(Order order, Product product, int quantity) {
        OrderItem orderItem = new OrderItem(order, product, quantity);

        try {
            em.getTransaction().begin();
            em.persist(orderItem);
            em.flush();
            em.getTransaction().commit();
        } catch (Exception ex) {
            return Optional.empty();
        }

        return Optional.of(orderItem);
    }

    /**
     * Add an address to the database, used while creating an order.
     * If the address already exists it directly returns it
     * @return address optional
     * */
    public Optional<Address> addAddress(
            String address_name, String address_city,
            String address_state, String post_code, String country_iso
    ) {
        //  If address already exists return address
        try {
            Optional<Address> opt_address = findAddress(address_name, address_city, address_state, post_code);
            if (opt_address.isPresent())
                return opt_address;
        } catch (NoResultException no_result) {
            //  continue
        }

        //  Fetch Country
        Country country;
        Optional<Country> opt_country = getCountry(country_iso);
        if (opt_country.isPresent()) {
            country = opt_country.get();
        }
        else
            throw new NullPointerException("Following country doesn't exists: " + country_iso);

        //  Create Address
        Address address = new Address(address_name, address_city, address_state, post_code, country);

        //  Persist
        try {
            em.getTransaction().begin();
            em.persist(address);
            em.flush();
            em.getTransaction().commit();
        } catch (Exception ex) {
            return Optional.empty();
        }

        return Optional.of(address);
    }

    /**
     * Get order by id, used in order history if user wasn't logged when did the order
     * @param order_id: the order id stored in cookie
     * */
    public Optional<Order> getOrder(long order_id) {
        return Optional.of(Optional.of(
                super.em.createNamedQuery("Order.findById", Order.class)
                        .setParameter("order_id", order_id)
                        .getSingleResult()
        ).orElse(null));
    }

    /**
     * Get order by username, used in order history if user was logged when did the order
     * @param user: the logged user who has done the order
     * */
    public Optional<List<Order>> getOrders(Users user) {
        return Optional.of(Optional.of(
                super.em.createNamedQuery("Order.findByUserId", Order.class)
                        .setParameter("user_id", user)
                        .getResultList()
        ).orElse(null));
    }

    /**
     * Get the count of order items for every order done during last month
     * @return the total number of ordered items during last month
     * */
    public long getSalesNumber() {
        Date current_date = new Date();
        Date start_date = getPreviousMonth(current_date);

        return
                super.em.createNamedQuery("Order.getSalesNumber", Long.class)
                        .setParameter("start_date", start_date)
                        .setParameter("end_date", current_date)
                        .getSingleResult();
    }

    /**
     * Get the price of order items for every order done during last month
     * @return the sum of all sold products during last month
     * */
    public BigDecimal getSalesRevenue() {
        Date current_date = new Date();
        Date start_date = getPreviousMonth(current_date);

        return
                super.em.createNamedQuery("Order.getSalesRevenue", BigDecimal.class)
                        .setParameter("start_date", start_date)
                        .setParameter("end_date", current_date)
                        .getSingleResult();
    }

    /**
     * @return the ten most sold products during last month
     * */
    public List<Product> getMostOrdered() {
        Date current_date = new Date();
        Date start_date = getPreviousMonth(current_date);

        return
                super.em.createNamedQuery("Order.getMostOrdered", Product.class)
                        .setParameter("start_date", start_date)
                        .setParameter("end_date", current_date)
                        .setMaxResults(10)
                        .getResultList();
    }

    /*-------------------------------------------------------------*/

    private Optional<Address> findAddress(
            String address_name, String address_city,
            String address_state, String post_code
    ) {
        return Optional.of(Optional.of(
                super.em.createNamedQuery("Address.findByAddress_equals", Address.class)
                        .setParameter("address_name", address_name)
                        .setParameter("city", address_city)
                        .setParameter("state", address_state)
                        .setParameter("eu_post_code", post_code)
                        .getSingleResult()
        ).orElse(null));
    }

    private Optional<StatusType> getStatusType(String status_name) {
        return Optional.of(Optional.of(
                super.em.createNamedQuery("StatusType.findStatusByName", StatusType.class)
                        .setParameter("status_name", status_name)
                        .getSingleResult()
        ).orElse(null));
    }

    private Optional<DeliveryType> getDeliveryType(String delivery_type) {
        return Optional.of(Optional.of(
                super.em.createNamedQuery("DeliveryType.findDeliveryByType", DeliveryType.class)
                        .setParameter("delivery_type", delivery_type)
                        .getSingleResult()
        ).orElse(null));
    }

    private Optional<Country> getCountry(String country_iso) {
        return Optional.of(Optional.of(
                super.em.createNamedQuery("Country.findByCountry_iso", Country.class)
                        .setParameter("country_iso", country_iso)
                        .getSingleResult()
        ).orElse(null));
    }

    private Date getPreviousMonth(Date current) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(current);
        calendar.add(Calendar.MONTH, -1);

        return calendar.getTime();
    }
}
