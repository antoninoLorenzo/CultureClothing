package com.culture.model.cart.beans;

import com.culture.model.users.beans.Users;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "cart")
@NamedQueries({
        @NamedQuery(name = "Cart.findByUser", query = "select c from Cart c where c.user_id = :user_id")
})
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long cart_id;

    @OneToOne
    @JoinColumn(name = "user_id")
    private Users user_id;

    public Cart(Users user) {
        this.user_id = user;
    }
}
