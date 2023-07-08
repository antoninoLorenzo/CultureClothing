package com.culture.model.products.beans;

import com.culture.model.products.beans.enums.Gender;
import com.culture.model.products.beans.enums.Size;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Entity(name = "product")
@Table()
@NamedQueries({
        @NamedQuery(name = "Product.findByName",
                query = "select p from product p where p.p_name = :p_name"),
        @NamedQuery(name = "Product.findByBrandId",
                query = "select p from product p where p.brand_id = :brand_id"),
        @NamedQuery(name = "Product.updateByQuantity",
                query = "update product p set p.stock_quantity = :stock_quantity"),
        @NamedQuery(name = "Product.findByP_id", query = "select p from product p where p.p_id = :p_id")
})
//@Cacheable
//@Cache(usage = CacheConcurrencyStrategy.READ_ONLY, region = "productCache")
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long p_id;

    @Column(name = "p_name")
    private String p_name;

    @Column(name = "p_desc")
    private String p_desc;

    @Column(name = "p_price")
    private BigDecimal p_price;

    @Column(name = "stock_quantity")
    private Integer stock_quantity;

    @Enumerated(EnumType.STRING)
    @Column(name = "gender")
    private Gender gender;

    @Column(name = "color")
    private String color;

    @Enumerated(EnumType.STRING)
    @Column(name = "size")
    private Size size;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category_id;

    @ManyToOne
    @JoinColumn(name = "brand_id")
    private Brand brand_id;

    public Product(String p_name, String p_desc, BigDecimal p_price,
                   Integer stock_quantity, Gender gender, String color,
                   Size size, Category category, Brand brand) {
        this.p_name = p_name;
        this.p_desc = p_desc;
        this.p_price = p_price;
        this.stock_quantity = stock_quantity;
        this.gender = gender;
        this.color = color;
        this.size = size;
        this.category_id = category;
        this.brand_id = brand;
    }
}
