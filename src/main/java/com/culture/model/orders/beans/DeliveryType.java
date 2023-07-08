package com.culture.model.orders.beans;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Entity(name = "delivery_types")
@Table()
@NamedQueries({
        @NamedQuery(name = "DeliveryType.findDeliveryByType", query = "select d from delivery_types d where d.delivery_type = :delivery_type")
})
@Getter
@Setter
@NoArgsConstructor
@ToString
public class DeliveryType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long delivery_id;

    @Column(name = "delivery_type")
    private String delivery_type;

    @Column(name = "required_days")
    private int required_days;

    @Column(name = "additional_price")
    private BigDecimal additional_price;
}
