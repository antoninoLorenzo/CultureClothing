package com.culture.model.products.repository;

import com.culture.model.Repository;
import com.culture.model.products.beans.Brand;
import com.culture.exceptions.InvalidProductBrandException;
import jakarta.persistence.NoResultException;
import lombok.NoArgsConstructor;

import java.util.Optional;

@NoArgsConstructor
public class BrandRepository extends Repository {
    public Optional<Brand> getBrandByName(String name) throws InvalidProductBrandException {
        try {
            String findByName = "SELECT pb FROM product_brand pb WHERE pb.brand_name = :brand";
            return Optional.of(super.em
                    .createQuery(findByName, Brand.class)
                    .setParameter("brand", name)
                    .getSingleResult());

        } catch (NoResultException e) {
            throw new InvalidProductBrandException(name + " is an invalid category.");
        }
    }
}
