package com.culture.model.products.repository;

import com.culture.model.Repository;
import com.culture.model.products.Page;
import com.culture.model.products.beans.Product;
import com.culture.model.products.beans.Brand;
import com.culture.model.products.beans.Category;
import com.culture.model.products.beans.SingleImage;
import jakarta.persistence.TypedQuery;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class ProductsRepository extends Repository {
    private static ProductsRepository instance;
    private static ImagesRepository imagesRepository;

    private final int PAGE_SIZE = 20;

    private ProductsRepository() {
        super();
    }

    public static synchronized ProductsRepository getInstance() {
        if (instance == null)
            instance = new ProductsRepository();

        imagesRepository = ImagesRepository.getInstance();

        return instance;
    }

    public boolean addProduct(Product product) {
        try {
            em.getTransaction().begin();
            em.persist(product);
            em.flush();
            em.getTransaction().commit();
        } catch (Exception ex) { return false; }
        return true;
    }

    public boolean addProductList(List<Product> products) {
        for (Product p : products)
            if (!addProduct(p))
                return false;
        return true;
    }

    public Product getProductById(String id) {
        return super.em
                .createNamedQuery("Product.findByP_id", Product.class)
                .setParameter("p_id", id)
                .getSingleResult();
    }

    /**
     * Method to find products based on name;
     * it is used in the search bar of the website
     * */
    public synchronized List<Product> getProductsByName(String name) {
        return super.em
                .createNamedQuery("Product.findByName", Product.class)
                .setParameter("p_name", name)
                .setHint("org.hibernate.cacheable", true)
                .getResultList();
    }

    /**
     * Method to find product based on page, using a cursor and limit approach
     * @param page: object containing page, Gender, Category, Brand
     * */
    public Map<Page, List<Product>> getProductsCursorBased(Page page){
        //  Get category and/or brand
        Category category = page.category();
        Brand brand = page.brand();
        if (category == null && brand == null)
            return Collections.emptyMap();

        //  build query string
        StringBuilder queryString = new StringBuilder("SELECT p FROM product p WHERE p.p_id > :p_id ");

        if (category != null)
            queryString.append("AND (p.category_id = :category_id OR p.category_id.parentCategory = :category_id OR p.category_id.parentCategory.parentCategory = :category_id) ");
        if (brand != null)
            queryString.append("AND p.brand_id = :brand_id ");

        //  Create query
        TypedQuery<Product> query = super.em.createQuery(queryString.toString(), Product.class);
        if (brand != null)
            query.setParameter("brand_id", brand);

        //  DEBUG
        //  System.out.println("Searching for products with p_id > " + PAGE_SIZE* page.pageNumber());
        query.setParameter("p_id", PAGE_SIZE * page.pageNumber());

        if (category != null)
            query.setParameter("category_id", category/*.getCategory_id()*/);

        //  Limit the results and return product list
        List<Product> products = query
                .setMaxResults(PAGE_SIZE)
                .getResultList();

        //  DEBUG
        /*
        System.out.println("Product List");
        if (products != null)
            for (Product p : products)
                System.out.println(p.getP_name());
        else
            System.out.println("Null");
        */

        //  Create and return the map
        Map<Page, List<Product>> output = new HashMap<>();
        output.put(page, products);
        return output;
    }

    /**
     * Retrieves the images related to every product
     * @param products: the products needed
     * @return map of images for every product
     * */
    public Map<Product, List<SingleImage>> getProductsImages(List<Product> products){
        //  Retrive images based on products
        List<List<SingleImage>> images = products
                .stream()
                .map(imagesRepository::getSingleProductImages)
                .toList();

        //  Map images to products
        Map<Product, List<SingleImage>> map = IntStream.range(0, products.size())
                .boxed()
                .collect(Collectors.toMap(
                        products::get,
                        images::get,
                        (list1, list2) -> {
                            List<SingleImage> mergedList = new ArrayList<>(list1);
                            mergedList.addAll(list2);
                            return mergedList;
                        }
                ));

        return map;
    }

    //
    //  DEPRECATED METHODS
    //

    /**
     * Method to find product based on page.
     * @param page: object containing information like page, Gender, Category, Brand
     * */
    @Deprecated
    public Map<Page, List<Product>> getProducts(Page page){
        //  Get category and/or brand
        Category category = page.category();
        Brand brand = page.brand();
        if (category == null && brand == null)
            return null;

        //  build query string
        StringBuilder queryString = new StringBuilder("SELECT p FROM product p");
        if (brand != null)
            queryString.append(" WHERE p.brand_id = :brand_id");
        if (category != null)
            queryString.append(" AND (p.category_id = :category_id OR p.category_id.parentCategory = :category_id OR p.category_id.parentCategory.parentCategory = :category_id)");

        //  Create query
        TypedQuery<Product> query = super.em.createQuery(queryString.toString(), Product.class);
        if (brand != null)
            query.setParameter("brand_id", brand);
        if (category != null)
            query.setParameter("category_id", category/*.getCategory_id()*/);

        //  Limit the results and return product list
        List<Product> products = query
                .setFirstResult(page.pageNumber() * PAGE_SIZE)
                .setMaxResults(PAGE_SIZE)
                .getResultList();

        //  Create and return the map
        Map<Page, List<Product>> output = new HashMap<>();
        output.put(page, products);
        return output;
    }

    //  Find products py category
    @Deprecated
    public List<Product> getProductsByCategory(Category category) {
        String recursiveCategorySearch = "SELECT p FROM product p " +
                "JOIN p.category_id c " +
                "WHERE c.category_id = :category_id " +
                "OR c.parentCategory.category_id = :category_id " +
                "OR c.parentCategory.parentCategory.category_id = :category_id";

        return super.em
                .createQuery(recursiveCategorySearch, Product.class)
                .setParameter("category_id", category.getCategory_id())
                .getResultList();
    }

    //  Find products by brand
    @Deprecated
    public List<Product> getProductsByBrand(Brand brand) {
        return super.em
                .createNamedQuery("Product.findByBrandId", Product.class)
                .setParameter("brand_id", brand)
                .getResultList();
    }


}
