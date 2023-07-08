package ProductsTesting;

import com.culture.exceptions.InvalidProductBrandException;
import com.culture.exceptions.InvalidProductCategoryException;
import com.culture.model.products.Page;
import com.culture.model.products.repository.BrandRepository;
import com.culture.model.products.repository.CategoryRepository;
import com.culture.model.products.repository.ProductsRepository;
import com.culture.model.products.beans.Product;
import com.culture.model.products.beans.Brand;
import com.culture.model.products.beans.Category;
import com.culture.model.products.beans.enums.Gender;
import com.culture.model.products.beans.enums.Size;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.junit.runners.MethodSorters;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ProductTest {
    @Test
    public void test1_addProduct() {
        ProductsRepository productsRepository = ProductsRepository.getInstance();
        Category jeansJackets = null;
        Brand karlKani = null;

        try {
            jeansJackets = new CategoryRepository()
                    .getCategoryByName("jeans jackets", Gender.Male)
                    .get();
            karlKani = new BrandRepository()
                    .getBrandByName("karl_kani")
                    .get();
        } catch (Exception ex) {
            Assertions.fail();
        }

        Product testProduct = new Product("testproduct", "test", new BigDecimal("10.2"),
                10, Gender.Male, "black", Size.L, jeansJackets, karlKani);

        Assertions.assertTrue(
                productsRepository
                        .addProduct(testProduct)
        );
    }

    @Test
    public void test2_getProductByName() {
        ProductsRepository productsRepository = ProductsRepository.getInstance();
        Assertions.assertNotNull(
                productsRepository
                        .getProductsByName("Blaise Leather Jacket Man")
        );
    }

    @Test
    public void test3_getProductsByPage() {
        //  Fetch category and brand from database
        Category category = null;
        Brand brand = null;
        try {
            category = new CategoryRepository()
                    .getCategoryByName("man", Gender.Male)
                    .orElse(null);
            assert category != null;

        } catch (InvalidProductCategoryException ex) {
            System.out.println(ex.getMessage());
        } catch (AssertionError assertionError) {
            System.out.println("Null category");
        }

        //  Init request page
        Page page = new Page(0, category, null);
        ProductsRepository productsRepository = ProductsRepository.getInstance();

        //  Get product pagination using cursor query approach
        Map<Page, List<Product>> productsMap = productsRepository.getProductsCursorBased(page);

        System.out.printf("\nProducts [%d]: \n", page.pageNumber());
        for (Page p : productsMap.keySet())
            productsMap.get(p).forEach(System.out::println);

        //
        Page second = new Page(1, category, null);

        Map<Page, List<Product>> productsMap2 = productsRepository.getProductsCursorBased(second);

        System.out.printf("\nProducts [%d]: \n", second.pageNumber());
        for (Page p : productsMap2.keySet())
            productsMap2.get(p).forEach(System.out::println);
    }
}
