package com.culture.model.products.beans;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity(name = "product_brand")
@Table(name = "product_brand")
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Brand {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long brand_id;

    @Column(name = "brand_name")
    private String brand_name;

    @Column(name = "logo_link")
    private String logo_link;
}
