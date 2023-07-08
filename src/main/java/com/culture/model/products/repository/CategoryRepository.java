package com.culture.model.products.repository;

import com.culture.model.Repository;
import com.culture.model.products.beans.Category;
import com.culture.model.products.beans.enums.Gender;
import com.culture.exceptions.InvalidProductCategoryException;
import jakarta.persistence.NoResultException;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Optional;

@NoArgsConstructor
public class CategoryRepository extends Repository {
    public Optional<Category> getCategoryByName(String name, Gender gender) throws InvalidProductCategoryException{
        try {
            String findByName = "SELECT pc FROM product_category pc WHERE pc.category_name = :category AND pc.gender = :gender";
            return Optional.of(super.em
                    .createQuery(findByName, Category.class)
                    .setParameter("category", name)
                    .setParameter("gender", gender)
                    .getSingleResult());

        } catch (NoResultException e) {
            throw new InvalidProductCategoryException(name + " is an invalid category.");
        }
    }

    public static Category getCategoryForProductName(String productName, List<Category> categories) {
        for (Category category : categories) {
            String categoryName = category.getCategory_name().toLowerCase();
            if (productName.toLowerCase().contains(categoryName)) {
                return category;
            }
        }
        System.out.println("Category not found for: " + productName);
        return null; // No matching category found
    }
}
