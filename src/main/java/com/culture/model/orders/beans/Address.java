package com.culture.model.orders.beans;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity(name = "address")
@Table()
@NamedQueries({
        @NamedQuery(name = "Address.findByAddress_equals", query = "select a from address a where a.address_name = :address_name and a.city = :city and a.state = :state and a.eu_post_code = :eu_post_code")
})
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long address_id;

    @Column(name = "address_name")
    private String address_name;

    @Column(name = "city")
    private String city;

    @Column(name = "state")
    private String state;

    @Column(name = "eu_post_code")
    private String eu_post_code;

    @ManyToOne
    @JoinColumn(name = "country_id")
    private Country country_id;

    public Address(String address_name, String city, String state, String eu_post_code, Country country) {
        this.address_name = address_name;
        this.city = city;
        this.state = state;
        this.eu_post_code = eu_post_code;
        this.country_id = country;
    }
}
