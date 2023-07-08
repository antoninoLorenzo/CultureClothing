package ProductsTesting;

import com.culture.model.products.repository.ImagesRepository;
import com.culture.model.products.repository.ProductsRepository;
import com.culture.model.products.beans.Product;
import com.culture.model.products.beans.SingleImage;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.junit.runners.MethodSorters;

import java.util.ArrayList;
import java.util.List;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ProductImagesTesting {
    @Test
    public void test1_setProductImages() {
        ImagesRepository imagesRepository = ImagesRepository.getInstance();
        List<Product> products = ProductsRepository.getInstance().getProductsByName("testproduct");

        SingleImage img1 = new SingleImage(products.get(0), "https://res.cloudinary.com/dnkkpp8pj/image/upload/v1683648373/products/karl-kani_clothing/men/knitwear/hoodie/Be%20Asiatic%20Hoodie/1_gys9gw.webp", 1);
        SingleImage img2 = new SingleImage(products.get(0), "https://res.cloudinary.com/dnkkpp8pj/image/upload/v1683648373/products/karl-kani_clothing/men/knitwear/hoodie/Be%20Asiatic%20Hoodie/2_bmtgfu.webp", 2);

        List<SingleImage> images = new ArrayList<>();
        images.add(img1);
        images.add(img2);

        Assertions.assertTrue(
                imagesRepository.setProductImages(images)
        );
    }

    @Test
    public void test2_getProductImages() {
        ImagesRepository imagesRepository = ImagesRepository.getInstance();
        List<Product> products = ProductsRepository.getInstance().getProductsByName("testproduct");

        List<SingleImage> images = imagesRepository.getSingleProductImages(products.get(0));
        Assertions.assertNotNull(images);
    }
}
