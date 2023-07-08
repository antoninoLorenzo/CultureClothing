package com.culture.controller.servlet.utilities;

import com.culture.exceptions.InvalidProductBrandException;
import com.culture.exceptions.InvalidProductCategoryException;
import com.culture.model.products.Page;
import com.culture.model.products.beans.Brand;
import com.culture.model.products.beans.Category;
import com.culture.model.products.beans.Product;
import com.culture.model.products.beans.SingleImage;
import com.culture.model.products.beans.enums.Gender;
import com.culture.model.products.repository.BrandRepository;
import com.culture.model.products.repository.CategoryRepository;
import com.culture.model.products.repository.ImagesRepository;
import com.culture.model.products.repository.ProductsRepository;
import com.culture.utils.cookies.CookieUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@WebServlet(name = "catalogAPI", urlPatterns = "/product-catalog")
public class ProductCatalogAPIServlet extends HttpServlet {
    private ProductsRepository productsRepository;
    private CategoryRepository categoryRepository;
    private BrandRepository brandRepository;
    private ImagesRepository imagesRepository;

    @Override
    public void init() throws ServletException {
        productsRepository = ProductsRepository.getInstance();
        categoryRepository = new CategoryRepository();
        imagesRepository = ImagesRepository.getInstance();
        brandRepository = new BrandRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");

        //  Retreive information on what products the user asked for
        Cookie[] cookies = request.getCookies();
        Cookie genderCookie = CookieUtils.searchCookie(cookies, "gender");
        Cookie categoryCookie = CookieUtils.searchCookie(cookies, "category");
        Cookie brandCookie = CookieUtils.searchCookie(cookies, "brand");

        //Cookie pageCookie = CookieUtils.searchCookie(cookies, "page");
        String pageNumberString = request.getParameter("page");
        int pageNumber = 0;
        if (!(pageNumberString == null || pageNumberString.isEmpty()))
            pageNumber = Integer.parseInt(pageNumberString);

        ObjectMapper mapper = new ObjectMapper();
        mapper.enable(SerializationFeature.INDENT_OUTPUT);

        try{
            //  Build string for requestedCategory and initialize Gender
            String categoryString = "";
            Optional<Category> requestedCategory = Optional.empty();
            Gender requestedGender = null;
            Optional<Brand> requestedBrand = Optional.empty();

            try {
                String category_cookie_value = categoryCookie.getValue();
                if (category_cookie_value != null) {
                    categoryString = category_cookie_value.isBlank() || category_cookie_value.isEmpty()
                            ? ""
                            : category_cookie_value + " ";
                }
            } catch (NullPointerException ex) {
                categoryString = "";
            }

            try {
                String gender_cookie_value = genderCookie.getValue();
                if (gender_cookie_value != null) {
                    if (gender_cookie_value.equals("male")) {
                        requestedGender = Gender.Male;
                        categoryString = categoryString.concat("man");
                    }
                    else if (gender_cookie_value.equals("female")) {
                        requestedGender = Gender.Female;
                        categoryString = categoryString.concat("woman");

                    } else if (gender_cookie_value.equals("unisex")) {
                        requestedGender = Gender.Unisex;
                        categoryString = categoryString.concat("unisex");
                    } else {
                        System.out.println("no gender selected");
                    }
                }
            } catch (NullPointerException ex) {
                requestedGender = Gender.Unisex;
                categoryString = categoryString.concat("unisex");
            }

            //  Retreive category from database
            if (!categoryString.equals("") && requestedGender != null)
                requestedCategory = categoryRepository
                        .getCategoryByName(categoryString, requestedGender);

            //  Get brand from database
            try {
                String brand_cookie_value = brandCookie.getValue();
                if (brand_cookie_value != null && !brand_cookie_value.isEmpty())
                    requestedBrand = brandRepository.getBrandByName(brand_cookie_value);
            } catch (NullPointerException ex) {
                requestedBrand = Optional.empty();
            }

            //  Retreive products from database
            Page page = new Page(pageNumber, requestedCategory.orElse(null), requestedBrand.orElse(null));

            //  DEBUG
            //  System.out.println("Page: " + page.pageNumber());

            //  Implement caching with product map
            Map<Page, List<Product>> productsMap = productsRepository.getProductsCursorBased(page);
            if (productsMap == null || productsMap.isEmpty())
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            else {
                List<Product> distinctProducts = productsMap.get(page).stream()
                        .collect(Collectors.toMap(Product::getP_name, p -> p, (p1, p2) -> p1))
                        .values()
                        .stream()
                        .toList();

                //  Retrieve images based on products
                Map<Product, List<SingleImage>> products = productsRepository.getProductsImages(distinctProducts);

                //  Send data back in JSON format
                String json = mapper.writeValueAsString(products);
                response.getWriter().write(json);
            }
        } catch (InvalidProductCategoryException | InvalidProductBrandException ex) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    @Override
    public void destroy() {
        productsRepository.closeEntityManager();
        categoryRepository.closeEntityManager();
        imagesRepository.closeEntityManager();
    }
}
