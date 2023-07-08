package ProductsTesting;

import com.culture.model.products.repository.CategoryRepository;
import com.culture.model.products.beans.enums.Gender;
import com.culture.exceptions.InvalidProductCategoryException;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class ProductCategoryTest {
    @Test
    public void testGetCategory() throws InvalidProductCategoryException {
        CategoryRepository categoryRepository = new CategoryRepository();

        Assertions.assertTrue(
                categoryRepository
                        .getCategoryByName("jeans jackets", Gender.Male)
                        .isPresent());
    }
}
