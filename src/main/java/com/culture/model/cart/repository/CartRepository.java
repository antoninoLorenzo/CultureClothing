package com.culture.model.cart.repository;

import com.culture.model.Repository;
import com.culture.model.cart.beans.Cart;
import com.culture.model.cart.beans.CartItem;
import com.culture.model.products.beans.Product;
import com.culture.model.products.repository.ProductsRepository;
import com.culture.model.users.beans.Users;
import jakarta.persistence.NoResultException;

import java.util.Optional;

public class CartRepository extends Repository {
    private static CartRepository instance;
    private static ProductsRepository productsRepository;

    private CartRepository() {
        super();
        if (productsRepository == null)
            productsRepository = ProductsRepository.getInstance();
    }

    public static synchronized CartRepository getInstance() {
        if (instance == null)
            instance = new CartRepository();

        return instance;
    }

    public boolean addItemToCart(Users user, String p_id) {

        CartItem item;
        Cart cart = null;
        Product product = productsRepository.getProductById(p_id);
        Optional<Cart> opt_cart = Optional.empty();

        try {
            opt_cart = getCart(user);
        } catch (NoResultException no_user) {
            cart = new Cart(user);
        }

        if (opt_cart.isPresent())
            cart = opt_cart.get();

        item = new CartItem(cart, product);

        //  Persist cart
        if (opt_cart.isPresent())
            return addCartItem(item);
        else
            return addCart(cart) && addCartItem(item);
    }

    public Optional<Cart> getCart(Users user) throws NoResultException {
        return Optional.of(Optional.of(
                super.em
                        .createNamedQuery("Cart.findByUser", Cart.class)
                        .setParameter("user_id", user)
                        .getSingleResult()
        )).orElse(null);
    }

    private boolean addCart(Cart cart) {
        try {
            em.getTransaction().begin();
            em.persist(cart);
            em.flush();
            em.getTransaction().commit();
        } catch (Exception ex) { return false; }
        return true;
    }

    private boolean addCartItem(CartItem cartItem) {
        try {
            em.getTransaction().begin();
            em.persist(cartItem);
            em.flush();
            em.getTransaction().commit();
        } catch (Exception ex) { return false; }
        return true;
    }
}
