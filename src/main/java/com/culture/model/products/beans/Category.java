package com.culture.model.products.beans;

import com.culture.model.products.beans.enums.Gender;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity(name = "product_category")
@Table(name = "product_category")
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long category_id;

    @ManyToOne
    @JoinColumn(name = "parent_category")
    private Category parentCategory;

    @Column(name = "category_name", nullable = false)
    private String category_name;

    @Enumerated(EnumType.STRING)
    @Column(name = "gender", nullable = false)
    private Gender gender;
}
