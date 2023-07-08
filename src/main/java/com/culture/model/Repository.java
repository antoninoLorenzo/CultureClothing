package com.culture.model;

import jakarta.persistence.*;

/**
 * Abstract class that represents a repository of a database entity
 * */
public abstract class Repository {
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    protected EntityManager em;
    private static EntityManagerFactory emf;

    public Repository() {
        if (emf == null)
            emf = Persistence.createEntityManagerFactory("culture_clothing");

        this.em = emf.createEntityManager();
    }

    public void closeEntityManager() {
        em.close();
    }

    protected void closeEntityManagerFactory() {
        if (emf != null)
            emf.close();
    }
}
