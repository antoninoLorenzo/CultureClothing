package com.culture.model.orders.beans;

import com.culture.model.payment.beans.Payment;
import com.culture.model.users.beans.Users;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.Date;

@Entity(name = "orders")
@Table()
@NamedQueries({
        @NamedQuery(name = "Order.findById", query = "select o from orders o where o.order_id = :order_id"),
        @NamedQuery(name = "Order.findByUserId", query = "select o from orders o where o.user_id = :user_id"),
        @NamedQuery(name = "Order.getSalesNumber", query =
                "SELECT SUM(it.quantity) AS total_quantity "
                        + "FROM order_items it "
                        + "INNER JOIN it.order_id o "
                        + "WHERE o.purchase_date BETWEEN :start_date AND :end_date"),
        @NamedQuery(name = "Order.getSalesRevenue", query =
                "SELECT SUM(it.price*it.quantity) AS total_revenue "
                + "FROM order_items it "
                + "INNER JOIN it.order_id o "
                + "WHERE o.purchase_date BETWEEN :start_date AND :end_date"),
        @NamedQuery(name = "Order.getMostOrdered", query =
                "SELECT it.product_id  "
                + "FROM order_items it "
                + "INNER JOIN it.order_id o "
                + "WHERE o.purchase_date BETWEEN :start_date AND :end_date "
                + "GROUP BY it.product_id "
                + "ORDER BY COUNT(it.product_id) DESC")
})
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long order_id;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = true)
    private Users user_id;

    @ManyToOne
    @JoinColumn(name = "payment_id", referencedColumnName = "payment_method_id")
    private Payment payment_id;

    @ManyToOne
    @JoinColumn(name = "shipping_address", referencedColumnName = "address_id")
    private Address shipping_address;

    @Column(name = "purchase_date")
    private Date purchase_date;

    @Column(name = "total_price")
    private BigDecimal total_price;

    @ManyToOne
    @JoinColumn(name = "status_id", referencedColumnName = "status_id")
    private StatusType status_id;

    @ManyToOne
    @JoinColumn(name = "delivery_type", referencedColumnName = "delivery_id")
    private DeliveryType delivery_type;

    public Order(Users user, Payment payment, Address address, Date purchase_date,
                 BigDecimal total_price, StatusType status, DeliveryType delivery) {
        this.user_id = user;
        this.payment_id = payment;
        this.shipping_address = address;
        this.purchase_date = purchase_date;
        this.total_price = total_price;
        this.status_id = status;
        this.delivery_type = delivery;

    }
}
