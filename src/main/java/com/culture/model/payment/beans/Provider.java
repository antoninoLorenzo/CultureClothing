package com.culture.model.payment.beans;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity(name = "payment_provider")
@Table()
@NamedQueries({
        //@NamedQuery(name = "Provider.findProviderByName", query = "select p from payment_provider p where p.provider_name = :provider_name")
        @NamedQuery(name = "Provider.findProviderByName", query = "select p from payment_provider p where p.provider_name = :provider_name")

})
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Provider {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long provider_id;

    @Column(name = "provider_name")
    private String provider_name;
}
