package com.culture.model.cart.beans;

import com.culture.model.products.beans.Product;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "cart_items")
@Getter
@Setter
@NoArgsConstructor
@ToString
public class CartItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long cart_items_id;

    @ManyToOne
    @JoinColumn(name = "cart_id")
    private Cart cart_id;

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "p_id")
    private Product p_id;

    public CartItem(Cart cart_id, Product p_id) {
        this.cart_id = cart_id;
        this.p_id    = p_id;
    }
}
