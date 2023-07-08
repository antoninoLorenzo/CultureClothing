package ProductsTesting;

import com.culture.model.products.beans.Product;
import com.culture.model.products.beans.SingleImage;
import com.culture.model.products.repository.ProductsRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class ProductRepositoryTesting {
    @Test
    public void performance_getProductsImages() {
        ProductsRepository productsRepository = ProductsRepository.getInstance();

        String[] productIDs = new String[]{"1", "2","3", "4","5", "6","7", "8","9", "10","11", "12","13", "14","15", "16","17", "18","19", "20",};

        List<Product> product_list = new ArrayList<>();
        Arrays.stream(productIDs)
                .forEach(id -> {
                    Product p = productsRepository.getProductById(id);
                    if (p != null)
                        product_list.add(p);
                });

        long start = System.currentTimeMillis();
        Map<Product, List<SingleImage>> products = productsRepository.getProductsImages(product_list);
        long end = System.currentTimeMillis();
        long time = end-start;

        System.out.println("Time: " + time + " ms");

        Assertions.assertNotNull(products);
    }

}
