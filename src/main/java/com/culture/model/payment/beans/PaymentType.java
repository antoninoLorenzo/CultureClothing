package com.culture.model.payment.beans;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity(name = "payment_type")
@Table()
@NamedQueries({
        //@NamedQuery(name = "PaymentType.findPaymentTypeByName", query = "select p from payment_type p where p.type_name = :type_name")
        @NamedQuery(name = "PaymentType.findPaymentTypeByName", query = "select p from payment_type p where p.type_name = :type_name")
})
@Getter
@Setter
@NoArgsConstructor
@ToString
public class PaymentType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long payment_type_id;

    @Column(name = "type_name")
    private String type_name;
}
