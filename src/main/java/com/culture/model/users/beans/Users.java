package com.culture.model.users.beans;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity(name = "users")
@Table()
@NamedQueries({
        @NamedQuery(name = "Users.getUUID", query = "select u.uuid from users u where u.user_id = :user_id"),
        @NamedQuery(name = "Users.isAdmin", query = "select u.uuid from users u where u.admin_user = true"),
        @NamedQuery(name = "Users.findByUuid", query = "select u from users u where u.uuid = :uuid")
})
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long user_id;

    @Column(name = "email")
    private String email;

    @Column(name = "psw_hash")
    private String psw_hash;

    @Column(name = "uuid")
    private String uuid;

    @Column(name = "admin_user")
    private boolean admin_user;

    public Users(String email, String psw_hash, String uuid) {
        this.email = email;
        this.psw_hash = psw_hash;
        this.uuid = uuid;
        this.admin_user = false;
    }
}
