package OrderTesting;

import com.culture.model.payment.repository.PaymentRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.Calendar;
import java.util.Date;

public class PaymentRepositoryTest {
    @Test
    public void addPayment() {
        PaymentRepository paymentRepository = PaymentRepository.getInstance();
        Assertions.assertTrue(
                paymentRepository.addPaymentMethod(
                        "1234567891234567"
                        , new Date(2024, Calendar.MAY, 1)
                        ,"mastercard"
                        ,"credit card").isPresent()
        );
    }
}
