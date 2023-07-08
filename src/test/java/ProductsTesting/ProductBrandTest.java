package ProductsTesting;

import com.culture.model.products.repository.BrandRepository;
import com.culture.exceptions.InvalidProductBrandException;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class ProductBrandTest {
    @Test
    public void testGetBrand() throws InvalidProductBrandException {
        BrandRepository brandRepository = new BrandRepository();

        Assertions.assertTrue(
                brandRepository
                        .getBrandByName("karl_kani")
                        .isPresent());
    }
}
