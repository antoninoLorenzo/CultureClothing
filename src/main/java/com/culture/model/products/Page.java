package com.culture.model.products;

import com.culture.model.products.beans.Brand;
import com.culture.model.products.beans.Category;

/**
 * Page 'pageNumber' must start from 0 to properly set the first result
 * */
public record Page(int pageNumber, Category category, Brand brand) {
    @Override
    public int pageNumber() {
        return pageNumber;
    }

    @Override
    public Category category() {
        return category;
    }

    @Override
    public Brand brand() {
        return brand;
    }
}
