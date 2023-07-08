package com.culture.model.payment.beans;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Entity(name = "payment_method")
@Table()
@NamedQueries({
        @NamedQuery(name = "Payment.findByAccount_number", query = "select p from payment_method p where p.account_number = :account_number")
})
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long payment_method_id;

    @Column(name = "account_number")
    private String account_number;

    @Column(name = "expiration_date")
    private Date expiration_date;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "provider", referencedColumnName = "provider_id")
    private Provider provider_id;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "payment_type", referencedColumnName = "payment_type_id")
    private PaymentType payment_type;

    public Payment(String account_number, Date expiration_date, Provider provider_id, PaymentType payment_type) {
        this.account_number = account_number;
        this.expiration_date = expiration_date;
        this.provider_id = provider_id;
        this.payment_type = payment_type;
    }
}
