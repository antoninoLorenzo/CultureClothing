USE culture_clothing;

ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_2;

ALTER TABLE payment_method MODIFY COLUMN payment_method_id INT AUTO_INCREMENT;

ALTER TABLE orders ADD CONSTRAINT orders_ibfk_2 FOREIGN KEY (payment_id) REFERENCES payment_method(payment_method_id);

