package com.culture.model.products.repository;

import com.culture.model.Repository;
import com.culture.model.products.beans.Product;
import com.culture.model.products.beans.SingleImage;

import java.util.List;

public class ImagesRepository extends Repository {
    private static ImagesRepository instance;

    private ImagesRepository() {
        super();
    }

    public static synchronized ImagesRepository getInstance() {
        if (instance == null)
            instance = new ImagesRepository();

        return instance;
    }
    public List<SingleImage> getSingleProductImages(Product product) {
        //  Why it throws IllegalStateException (update or delete???) / NoSuchElementException (???)
        try {
            return super.em
                    .createNamedQuery("SingleImage.findByProduct", SingleImage.class)
                    .setParameter("product_id", product)
                    .getResultList();
        } catch (Exception ex) {
            //  Brute force retry
            return super.em
                    .createNamedQuery("SingleImage.findByProduct", SingleImage.class)
                    .setParameter("product_id", product)
                    .getResultList();
        }
    }

    public boolean setProductImages(List<SingleImage> images) {
        for (SingleImage img : images)
            if (!addSingleImage(img))
                return false;
        return true;
    }

    public boolean addSingleImage(SingleImage img) {
        try {
            em.getTransaction().begin();
            em.persist(img);
            em.getTransaction().commit();
        } catch (Exception ex) { return false; }
        return true;
    }
}
