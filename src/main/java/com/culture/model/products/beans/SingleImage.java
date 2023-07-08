package com.culture.model.products.beans;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity(name = "product_single_image")
@Table()
@NamedQueries({
        @NamedQuery(name = "SingleImage.findByProduct", query = "select p from product_single_image p where p.product_id = :product_id")/*,
        @NamedQuery(name = "SingleImage.findByProductList", query = "select img from product_single_image img where img.product_id in :products")*/
})
@Getter
@Setter
@NoArgsConstructor
@ToString
public class SingleImage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long image_id;

    @OneToOne
    @JoinColumn(name = "product_id")
    private Product product_id;

    @Column(name = "image_link")
    private String image_link;

    @Column(name = "position")
    private Integer position;

    public SingleImage(Product product, String image_link, Integer position) {
        this.product_id = product;
        this.image_link = image_link;
        this.position = position;
    }
}
