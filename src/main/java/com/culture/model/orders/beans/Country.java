package com.culture.model.orders.beans;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity(name = "country")
@Table()
@NamedQueries({
        @NamedQuery(name = "Country.findByCountry_iso", query = "select c from country c where c.country_iso = :country_iso")
})
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Country {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long country_id;

    @Column(name = "country_iso")
    private String country_iso;
}
