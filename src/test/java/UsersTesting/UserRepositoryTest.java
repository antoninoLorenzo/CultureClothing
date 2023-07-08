package UsersTesting;

import com.culture.model.users.repository.UsersRepository;
import com.culture.model.users.beans.Users;
import org.junit.FixMethodOrder;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.runners.MethodSorters;
import org.mindrot.jbcrypt.BCrypt;

import java.util.Optional;
import java.util.Scanner;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class UserRepositoryTest {
    @Test
    public void test_1_UserExists() {
        UsersRepository usersRepository = UsersRepository.getInstance();

        Assertions.assertTrue(usersRepository.existsUser("antonino.lorenzo02@gmail.com"));
        Assertions.assertFalse(usersRepository.existsUser("example@gmail.com"));
    }

    @Test
    public void test_2_RegisterUser() {
        UsersRepository usersRepository = UsersRepository.getInstance();

        Users newUser = new Users();
        newUser.setEmail("collab.beatbuster@gmail.com");
        newUser.setPsw_hash(BCrypt.hashpw("hello", BCrypt.gensalt()));
        newUser.setAdmin_user(false);

        Users existingUser = new Users();
        existingUser.setEmail("collab.beatbuster@gmail.com");
        existingUser.setPsw_hash(BCrypt.hashpw("hello", BCrypt.gensalt()));
        existingUser.setAdmin_user(false);

        //  Valid new user
        Assertions.assertTrue(
                usersRepository
                        .registerUser(newUser)
        );

        //  Existing user
        Assertions.assertFalse(
                usersRepository
                        .registerUser(existingUser)
        );
    }

    @Test
    public void test_3_LoginUser() {
        UsersRepository usersRepository = UsersRepository.getInstance();

        //  Valid login
        Optional<Users> out_1 = usersRepository
                .loginUser("collab.beatbuster@gmail.com", "hello");
        Assertions.assertTrue(out_1.isPresent());

        //  Wrong password
        Optional<Users> out_2 = usersRepository
                .loginUser("collab.beatbuster@gmail.com", "hell");
        Assertions.assertTrue(out_2.isEmpty());

        //  Not existing user
        Optional<Users> out_3 = usersRepository
                .loginUser("notexist@gmail.com", "randompsw");
        Assertions.assertTrue(out_3.isEmpty());
    }

    @Test
    public void test_4_getUUID() {
        UsersRepository usersRepository = UsersRepository.getInstance();

        String email = "example@gmail.com";
        String password = "3xAmpleee";

        Optional<Users> opt_user = usersRepository.loginUser(email, password);
        Assertions.assertTrue(
                opt_user.isPresent()
        );

        String uuid = usersRepository.getUUID(opt_user.get());
        Assertions.assertNotNull(uuid);
    }
}
