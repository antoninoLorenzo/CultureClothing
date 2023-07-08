USE culture_clothing;

-- product category
INSERT INTO product_category (category_id, category_name, gender) VALUES 
(1, "man", 'Male'),
(2, "woman", 'Female'),
(3, "unisex", 'Unisex');

INSERT INTO product_category VALUES 
-- General categories
(4, 1, "jackets man", 'Male'),
(5, 2, "jackets woman", 'Female'),
(6, 1, "knitwear man", 'Male'),
(7, 2, "knitwear woman", 'Female'),
(8, 1, "pants man", 'Male'),
(9, 2, "pants woman", 'Female'),
(10, 3, "footwear unisex", 'Unisex'),
-- knitwear subcategories
(11, 6, "hoodie man", 'Male'),
(12, 7, "hoodie woman", 'Female'),
(13, 6, "longsleeve man", 'Male'),
(14, 7, "longsleeve woman", 'Female'),
(15, 6, "t-shirt man", 'Male'),
(16, 7, "t-shirt woman", 'Female'),
-- pants subcategories
(17, 8, "joggers pants man", 'Male'),
(18, 9, "joggers pants woman", 'Female'),
(19, 8, "leather pants man", 'Male'),
(20, 9, "leather pants woman", 'Female'),
(21, 8, "shorts pants man", 'Male'),
(22, 9, "shorts pants woman", 'Female'),
(31, 9, "leggins pants woman", 'Female'),
-- jackets subcategories
(23, 4, "jeans jacket man", 'Male'),
(24, 5, "jeans jacket woman", 'Female'),
(25, 4, "leather jacket man", 'Male'),
(26, 5, "leather jacket woman", 'Female'),
(27, 4, "bomber jacket man", 'Male'),
(28, 5, "bomber jacket woman", 'Female'),
(29, 4, "winter jacket man", 'Male'),
(30, 5, "winter jacket woman", 'Female');

-- product brand
INSERT INTO product_brand (brand_name, logo_link) VALUES 
("nike", "https://res.cloudinary.com/dnkkpp8pj/image/upload/v1683281807/brands_logos/nike_logo_bn9p9m.svg"),
("carhartt", "https://res.cloudinary.com/dnkkpp8pj/image/upload/v1683281732/brands_logos/carhartt_logo_vjzk8v.svg"),
("karl_kani", "https://res.cloudinary.com/dnkkpp8pj/image/upload/v1683281732/brands_logos/karl_kani_logo_ggkb3m.svg"),
("stussy", "https://res.cloudinary.com/dnkkpp8pj/image/upload/v1683281732/brands_logos/stussy-1_uccxag.svg");

-- products (id, name, description, price, stock, gender, color, size, category_id, brand_id)
-- INSERT INTO product (p_name, p_desc, p_price, stock_quantity, gender, color, size, category_id, brand_id)
-- VALUES

-- product variants (variant, original)
-- ...
-- product single images (link, position)
-- ...
-- product images (img_id, product_id)
-- ...

-- payment provider
INSERT INTO payment_provider (provider_name) VALUES 
("mastercard"),
("paypal"),
("visa");

-- payment type
INSERT INTO payment_type (type_name) VALUES 
("credit card"),
("debit card"),
("prepaid card"),
("bank account");

-- delivery types 
INSERT INTO delivery_types (delivery_type, required_days, additional_price) VALUES 
("standard delivery", 7, 0),
("express delivery", 3, 15),
("next-day delivery", 1, 30);

-- status types
INSERT INTO status_types (status_name) VALUES 
("ordered"),
("shipped"),
("delivered");

-- country
INSERT INTO country (country_iso) VALUES 
("IT");