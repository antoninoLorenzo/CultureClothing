package com.culture.model.users.beans;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Entity(name = "users_data")
@Table(name = "users_data")
@Getter
@Setter
@NoArgsConstructor
@ToString
public class UsersData {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long data_id;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private Users user;

    @Column(name = "user_name")
    private String user_name;

    @Column(name = "user_surname")
    private String user_surname;

    @Column(name = "birthdate")
    private Date birthdate;

    @Column(name = "gender")
    private String gender;

    @Column(name = "ordered_brands")
    private Long ordered_brands;

    @Column(name = "added_brands")
    private Long added_brands;

    public UsersData(Users user, String user_name, String user_surname, Date birthdate, String gender) {
        this.user = user;
        this.user_name = user_name;
        this.user_surname = user_surname;
        this.birthdate = birthdate;
        this.gender = gender;
    }

}
