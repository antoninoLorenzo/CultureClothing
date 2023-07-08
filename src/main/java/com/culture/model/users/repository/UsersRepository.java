package com.culture.model.users.repository;

import com.culture.model.Repository;
import com.culture.model.products.repository.ProductsRepository;
import com.culture.model.users.beans.Users;
import org.mindrot.jbcrypt.BCrypt;

import java.util.List;
import java.util.Optional;
import java.util.regex.Pattern;

/**
 *  Class to manage users in the database (DAO)
 * */
public class UsersRepository extends Repository {
    private final String existsQuery = String.format("%s %s %s"
                                                    ,"SELECT CASE"
                                                    ,"WHEN COUNT(u) > 0 THEN true ELSE false END"
                                                    ,"FROM users u WHERE u.email = :email");
    private final String loginQuery = String.format("%s %s"
                                                    ,"SELECT u FROM users u"
                                                    ,"WHERE u.email = :email");
    private static UsersRepository instance;

    private UsersRepository() {
        super();
    }

    public static synchronized UsersRepository getInstance() {
        if (instance == null)
            instance = new UsersRepository();

        return instance;
    }

    public boolean existsUser(String email) {
        return super.em
                .createQuery(existsQuery, Boolean.class)
                .setParameter("email", email)
                .getSingleResult();
    }

    public boolean registerUser(Users user) {
        try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
        } catch (Exception ex) { return false; }
        return true;
    }

    public Optional<Users> loginUser(String inputEmail, String inputPassword) {
        String email = inputEmail.trim();
        String password = inputPassword.trim();
        Optional<Users> output = Optional.empty();

        if (!existsUser(email)) {
            return output;
        } else {
            Users user = super.em
                    .createQuery(loginQuery, Users.class)
                    .setParameter("email", email)
                    .getSingleResult();

            if (BCrypt.checkpw(password, user.getPsw_hash())) {
                return Optional.of(user);
            }
        }
        return output;
    }

    public String getUUID(Users user) {
        return super.em.
                createNamedQuery("Users.getUUID", String.class)
                .setParameter("user_id", user.getUser_id())
                .getSingleResult();
    }

    public Optional<Users> findByUUID(String uuid) {
        return Optional.of(Optional.of(
                super.em.createNamedQuery("Users.findByUuid", Users.class)
                        .setParameter("uuid", uuid)
                        .getSingleResult()
        )).orElse(null);
    }

    public boolean isAdmin(String uuid) {
        List<String> uuids = super.em
                .createNamedQuery("Users.isAdmin", String.class)
                .getResultList();

        for (String id : uuids)
            if (id.equals(uuid))
                return true;

        return false;
    }
    public void updateUUID(String uuid) {

    }

    private static final String EMAIL_PATTERN =
            "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                    + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

    public static boolean isValidEmail(String email) {
        Pattern pattern = Pattern.compile(EMAIL_PATTERN);
        return pattern.matcher(email).matches();
    }
}
