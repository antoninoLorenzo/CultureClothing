DROP DATABASE IF EXISTS culture_clothing;
CREATE DATABASE culture_clothing;
USE culture_clothing;

/*
	TABLES
*/

-- USER RELATED TABLES
CREATE TABLE users(
	user_id				INT					PRIMARY KEY AUTO_INCREMENT
    ,email				VARCHAR(255)		NOT NULL UNIQUE		
    ,psw_hash			VARCHAR(255)		NOT NULL	
    ,uuid				VARCHAR(255)
    ,admin_user			BOOLEAN 			-- default = false
    ,CHECK (email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
);
-- add index to user email (login)
CREATE INDEX idx_email ON users (email);

CREATE TABLE users_data(
	data_id				INT					PRIMARY KEY	AUTO_INCREMENT
    ,user_id			INT					NOT NULL UNIQUE
    ,user_name			VARCHAR(30)			
    ,user_surname		VARCHAR(30)
    ,birthdate			DATE
    ,gender 			ENUM('Male', 'Female', 'Unisex')
	,ordered_brands		INT					-- must add reference
    ,added_brands		INT					-- must add reference
    ,FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- PRODUCT RELATED TABLES
CREATE TABLE product_category(
	category_id			INT					PRIMARY KEY
    ,parent_category	INT 				
    ,category_name		VARCHAR(30)			NOT NULL
	,gender 			ENUM('Male', 'Female', 'Unisex')	NOT NULL 	
    ,FOREIGN KEY (parent_category) REFERENCES product_category(category_id)
);
CREATE TABLE product_brand(
	brand_id			INT 				PRIMARY KEY AUTO_INCREMENT
    ,brand_name			VARCHAR(30)			NOT NULL
    ,logo_link			VARCHAR(250)		NOT NULL
);

CREATE TABLE product(
	p_id				INT					PRIMARY KEY	AUTO_INCREMENT
    ,p_name				VARCHAR(250)		NOT NULL
    ,p_desc				VARCHAR(250)		NOT NULL
    ,p_price			DECIMAL(10,2)		NOT NULL	CHECK (p_price > 0)
    ,stock_quantity		INT					NOT NULL	CHECK (stock_quantity >= 0)
    ,gender 			ENUM('Male', 'Female', 'Unisex')		
	,color				VARCHAR(20) 		NOT NULL
    ,size 				ENUM('S', 'M', 'L', 'XL') 			NOT NULL
    ,category_id		INT					
    ,brand_id			INT
    ,FOREIGN KEY (category_id) REFERENCES product_category(category_id)
	,FOREIGN KEY (brand_id) REFERENCES product_brand(brand_id)
);

CREATE TABLE product_variant(
	-- join table to link same products in different variants
	var_id				INT					NOT NULL
    ,p_id				INT 				NOT NULL
    ,FOREIGN KEY (var_id) REFERENCES product(p_id)
    ,FOREIGN KEY (p_id) REFERENCES product(p_id)
);

-- only one image per position => UNIQUE INDEX should be added
CREATE TABLE product_single_image(
	image_id			INT 				PRIMARY KEY AUTO_INCREMENT
    ,product_id			INT 				
    ,image_link			VARCHAR(250)		NOT NULL
    ,position			INT 				NOT NULL
	,FOREIGN KEY(product_id) REFERENCES product(p_id)
);

-- CART RELATED TABLES
CREATE TABLE cart(
	cart_id				INT 				PRIMARY KEY AUTO_INCREMENT
    ,user_id			INT					NOT NULL UNIQUE
    ,FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE cart_items(	
	-- join table
	cart_id				INT
    ,product_id         INT
    ,FOREIGN KEY (cart_id) REFERENCES cart(cart_id)
    ,FOREIGN KEY (product_id) REFERENCES product(p_id)
);

-- PAYMENT RELATED TABLES
CREATE TABLE payment_provider (
	provider_id			INT 				PRIMARY KEY AUTO_INCREMENT
    ,provider_name 		VARCHAR(250) 		NOT NULL
);

CREATE TABLE payment_type (
	payment_type_id		INT 				PRIMARY KEY AUTO_INCREMENT
    ,type_name			VARCHAR(250) 		NOT NULL
);

CREATE TABLE payment_method (
	payment_method_id	INT 				PRIMARY KEY 	-- autoincrement
    ,account_number 	VARCHAR(17) 		NOT NULL
    ,expiration_date	DATE 				NOT NULL
    ,provider			INT 				NOT NULL
    ,payment_type		INT 				NOT NULL
    ,FOREIGN KEY (provider) REFERENCES payment_provider(provider_id)
    ,FOREIGN KEY (payment_type) REFERENCES payment_type(payment_type_id)
);

-- ORDER RELATED TABLES

CREATE TABLE delivery_types (
	delivery_id			INT 				PRIMARY KEY AUTO_INCREMENT
    ,delivery_type 		VARCHAR(250) 		NOT NULL
    ,required_days		INT 				NOT NULL
    ,additional_price	DECIMAL(10, 2) 		NOT NULL CHECK(additional_price >= 0)
);

CREATE TABLE status_types (
	status_id			INT 				PRIMARY KEY AUTO_INCREMENT
    ,status_name		VARCHAR(250)		NOT NULL
);

CREATE TABLE country (
	country_id			INT 				PRIMARY KEY AUTO_INCREMENT
    ,country_iso		CHAR(3)
);

CREATE TABLE address(
	address_id			INT 				PRIMARY KEY AUTO_INCREMENT
    ,address_name		VARCHAR(250)		NOT NULL
    ,city				VARCHAR(250)		NOT NULL
    ,state				VARCHAR(250)		NOT NULL
    ,eu_post_code		CHAR(11) 			NOT NULL
    ,country_id			INT 				NOT NULL
    ,FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE TABLE orders (
	order_id			INT 				PRIMARY KEY AUTO_INCREMENT
    ,user_id			INT					NOT NULL
    ,payment_id			INT 				NOT NULL
    ,shipping_address	INT 				NOT NULL	-- deve essere creato prima l'indirizzo dell'ordine
    ,purchase_date		DATE 				NOT NULL
    ,total_price		INT 
    ,status_id			INT 				NOT NULL
    ,delivery_type		INT 				NOT NULL
    ,FOREIGN KEY (user_id) REFERENCES users(user_id)
    ,FOREIGN KEY (payment_id) REFERENCES payment_method(payment_method_id)
    ,FOREIGN KEY (shipping_address) REFERENCES address(address_id)
    ,FOREIGN KEY (status_id) REFERENCES status_types(status_id)
    ,FOREIGN KEY (delivery_type) REFERENCES delivery_types(delivery_id)
);

CREATE TABLE order_items (
	-- join table
    order_id			INT 				NOT NULL
    ,product_id			INT 				NOT NULL
    ,price				DECIMAL(10,2)		NOT NULL
    ,quantity			INT 				NOT NULL
    ,FOREIGN KEY (order_id) REFERENCES orders(order_id)
    ,FOREIGN KEY (product_id) REFERENCES product(p_id)
);

/*
	TRIGGERS
*/

-- Trigger to create a row in users_data and in cart tables when a new user is added
/*
DELIMITER $$
CREATE TRIGGER tr_create_user_data_and_cart 
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    -- Create a new row in the users_data table
    INSERT INTO users_data (user_id) VALUES (NEW.user_id);

    -- Create a new row in the cart table
    INSERT INTO cart (user_id) VALUES (NEW.user_id);
END$$
DELIMITER ;
*/
-- Trigger to check the quantity of a product before inserting into cart
DELIMITER $$
CREATE TRIGGER tr_check_stock_products_before_cart
BEFORE INSERT ON cart_items
FOR EACH ROW
BEGIN
	DECLARE available INT;
	SELECT stock_quantity INTO available FROM product WHERE product.p_id = NEW.cart_items(product_id);
	
    IF (available = 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Product out of stock';
	END IF;
END $$
DELIMITER ;
order_id
-- Trigger to calculate the total_price of an order 
DELIMITER $$
CREATE TRIGGER tr_calc_order_price
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    -- get total price
    DECLARE tot DECIMAL(10, 2);
    SELECT total_price INTO tot FROM orders WHERE orders.order_id = NEW.order_id;

    -- total_price + new.order_items.price
    SET tot = tot + (NEW.price * NEW.quantity);

    -- replace total_price with sum
    UPDATE orders SET total_price = tot WHERE order_id = NEW.order_id;
END $$
DELIMITER ;