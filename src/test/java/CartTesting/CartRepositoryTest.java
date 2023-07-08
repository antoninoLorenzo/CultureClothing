package CartTesting;

import com.culture.model.cart.repository.CartRepository;
import com.culture.model.users.beans.Users;
import com.culture.model.users.repository.UsersRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class CartRepositoryTest {
    @Test
    public void testAddItemToCart() {
        Users user = UsersRepository.getInstance()
                .loginUser("", "")
                .get();

        String p_id = "1";

        CartRepository cartRepository = CartRepository.getInstance();

        Assertions.assertTrue(
                cartRepository.addItemToCart(user, p_id)
        );

        Assertions.assertTrue(
                cartRepository.addItemToCart(user, "8")
        );
    }
}
