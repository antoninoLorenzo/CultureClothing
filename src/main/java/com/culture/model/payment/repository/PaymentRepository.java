package com.culture.model.payment.repository;

import com.culture.model.Repository;
import com.culture.model.payment.beans.Payment;
import com.culture.model.payment.beans.PaymentType;
import com.culture.model.payment.beans.Provider;
import com.culture.model.products.repository.ProductsRepository;
import jakarta.persistence.NoResultException;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.Optional;

public class PaymentRepository extends Repository {
    private static PaymentRepository instance;
    private PaymentRepository() { super(); }
    public static synchronized PaymentRepository getInstance() {
        if (instance == null)
            instance = new PaymentRepository();

        return instance;
    }

    public Optional<Payment> addPaymentMethod(String account_number, Date expiration_date, String provider_name, String type_name) {
        //  If payment method already exists return it
        try {
            Optional<Payment> opt_payment = getPayment(account_number);
            if (opt_payment.isPresent())
                return opt_payment;
        } catch (NoResultException no_result) {
            //  continue
        }

        //  Fetch provider
        Provider provider;
        Optional<Provider> opt_provider = getProvider(provider_name);
        if (opt_provider.isPresent()) {
            provider = opt_provider.get();
        }
        else
            throw new NullPointerException("Following provider doesn't exists: " + provider_name);

        //  Fetch Type
        PaymentType type;
        Optional<PaymentType> opt_type = getPaymentType(type_name);
        if (opt_type.isPresent()) {
            type = opt_type.get();
        }
        else
            throw new NullPointerException("Following type doesn't exists: " + type_name);

        //  Build Payment object
        Payment payment = new Payment(account_number, expiration_date, provider, type);

        //  Persist
        try {
            em.getTransaction().begin();
            em.persist(payment);
            em.flush();
            em.getTransaction().commit();
        } catch (Exception ex) {
            return Optional.empty();
        }
        return Optional.of(payment);
    }

    public Optional<Payment> getPayment(String account_number) {
        return Optional.of(Optional.of(
                super.em.createNamedQuery("Payment.findByAccount_number", Payment.class)
                        .setParameter("account_number", account_number)
                        .getSingleResult()
        ).orElse(null));
    }

    private Optional<Provider> getProvider(String provider_name) {
        return Optional.of(Optional.of(
                super.em.createNamedQuery("Provider.findProviderByName", Provider.class)
                        .setParameter("provider_name", provider_name)
                        .getSingleResult()
        ).orElse(null));
    };

    private Optional<PaymentType> getPaymentType(String type_name) {
        return Optional.of(Optional.of(
                super.em.createNamedQuery("PaymentType.findPaymentTypeByName", PaymentType.class)
                        .setParameter("type_name", type_name)
                        .getSingleResult()
        ).orElse(null));
    }
}
