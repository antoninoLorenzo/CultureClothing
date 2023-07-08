package UsersTesting;

import com.culture.model.users.repository.UsersDataRepository;
import com.culture.model.users.repository.UsersRepository;
import com.culture.model.users.beans.Users;
import com.culture.model.users.beans.UsersData;
import org.junit.FixMethodOrder;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.runners.MethodSorters;
import org.mindrot.jbcrypt.BCrypt;

import java.util.Optional;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class UserDataRepositoryTest {
    @Test
    public void test1_registerWithUserData() {
        UsersRepository usersRepository = UsersRepository.getInstance();
        UsersDataRepository usersDataRepository = new UsersDataRepository();

        Users newUser = new Users();
        newUser.setEmail("collab.beatbuster@gmail.com");
        newUser.setPsw_hash(BCrypt.hashpw("hello", BCrypt.gensalt()));
        newUser.setAdmin_user(false);

        UsersData newUserData = new UsersData();
        newUserData.setUser(newUser);
        newUserData.setUser_name("antonino");
        newUserData.setUser_surname("lorenzo");

        try {
            boolean registerUser = usersRepository.registerUser(newUser);
            boolean registerUserData = usersDataRepository.registerUserData(newUserData);
            System.out.println(registerUser + " " + registerUserData);
            Assertions.assertTrue(registerUser && registerUserData);
        } catch (Exception e) {
            e.printStackTrace();
            Assertions.fail("An exception occurred during the test: " + e.getMessage());
        }
    }

    @Test
    public void test2_getUsersData() {
        UsersRepository usersRepository = UsersRepository.getInstance();
        UsersDataRepository usersDataRepository = new UsersDataRepository();

        Optional<Users> opt = usersRepository.loginUser("collab.beatbuster@gmail.com", "hello");
        Users registered = null;
        if(opt.isPresent())
            registered = opt.get();

        Assertions.assertTrue(opt.isPresent());

        Optional<UsersData> usersData = usersDataRepository.getUsersData(registered);
        Assertions.assertTrue(usersData.isPresent());
    }

    @Test
    public void test3_editUserData() {
        UsersRepository usersRepository = UsersRepository.getInstance();
        UsersDataRepository usersDataRepository = new UsersDataRepository();

        Optional<Users> opt = usersRepository.loginUser("collab.beatbuster@gmail.com", "hello");
        Users registered = null;
        if(opt.isPresent())
            registered = opt.get();

        Assertions.assertTrue(opt.isPresent());

        UsersData newUserData = new UsersData();
        newUserData.setUser(registered);
        newUserData.setUser_name("antonino");
        newUserData.setUser_surname("antonino");
        newUserData.setGender("Male");


        try {
            boolean updateUserData = usersDataRepository.updateUserData(registered, newUserData);
            Assertions.assertTrue(updateUserData);
        } catch (Exception e) {
            e.printStackTrace();
            Assertions.fail("An exception occurred during the test: " + e.getMessage());
        }
    }


}
