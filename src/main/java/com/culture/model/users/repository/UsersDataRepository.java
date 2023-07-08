package com.culture.model.users.repository;

import com.culture.model.Repository;
import com.culture.model.users.beans.Users;
import com.culture.model.users.beans.UsersData;

import java.util.Optional;

public class UsersDataRepository extends Repository {
    private final String fullUpdate = String.format("%s %s %s %s"
                                            ,"UPDATE users_data ud SET"
                                            ,"ud.user_name = :name, ud.user_surname = :surname, "
                                            ,"ud.birthdate = :birthdate, ud.gender = :gender "
                                            ,"WHERE ud.user = :user");
    private final String selectData = String.format("%s %s"
                                            ,"SELECT ud FROM users_data ud"
                                            ,"WHERE ud.user = :user");

    public UsersDataRepository() { super(); }

    public boolean registerUserData(UsersData usersData) {
        try {
            em.getTransaction().begin();
            em.persist(usersData);
            em.getTransaction().commit();
        } catch (Exception ex) { return false; }
        return true;
    }

    public boolean updateUserData(Users user, UsersData usersData) {
        //  verify that user exists
        if ( !(UsersRepository.getInstance().existsUser(user.getEmail())) ) {
            System.out.println("user don't exists");
            return false;
        }

        try {
            super.em
                    .getTransaction()
                    .begin();

            super.em
                    .createQuery(fullUpdate)
                            .setParameter("name", usersData.getUser_name())
                            .setParameter("surname", usersData.getUser_surname())
                            .setParameter("birthdate", usersData.getBirthdate())
                            .setParameter("gender", usersData.getGender())
                            .setParameter("user", user)
                                    .executeUpdate();

            super.em
                    .getTransaction()
                    .commit();
        } catch (Exception ex) {
            System.out.println("something went wrong: \n");
            return false;
        }

        return true;
    }

    public Optional<UsersData> getUsersData(Users user) {
        Optional<UsersData> output = Optional.empty();

        if ( !(UsersRepository.getInstance().existsUser(user.getEmail()))) {
            System.out.println("user don't exists");
            return output;
        } else {
            UsersData usersData = super.em
                    .createQuery(selectData, UsersData.class)
                    .setParameter("user", user)
                    .getSingleResult();

            return Optional.of(usersData);
        }
    }
}
