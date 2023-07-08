package com.culture.model.orders.beans;

import com.culture.model.products.beans.Product;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Entity(name = "order_items")
@Table()
@Getter
@Setter
@NoArgsConstructor
@ToString
public class OrderItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long item_id;

    @ManyToOne
    @JoinColumn(name = "order_id", referencedColumnName = "order_id")
    private Order order_id;

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "p_id")
    private Product product_id;

    @Column(name = "price")
    private BigDecimal price;

    @Column(name = "quantity")
    private int quantity;

    public OrderItem(Order order, Product product, int quantity) {
        this.order_id = order;
        this.product_id = product;
        this.price = product.getP_price();
        this.quantity = quantity;
    }
}
