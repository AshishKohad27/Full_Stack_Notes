-- 1. Create Databases
-- DROP DATABASE taza_chocolate;
CREATE DATABASE IF NOT EXISTS taza_chocolate;

-- 2. Use "taza_chocolate"
USE taza_chocolate;

-- 3. Select "taza_chocolate"
SELECT database();

-- 4. Tables Creations
-- 4.1 Users
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ALTER TABLE users
-- ADD COLUMN role ENUM('admin', 'user') DEFAULT 'user';

-- 4.2 Address
CREATE TABLE IF NOT EXISTS shipping_addresses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    address_line VARCHAR(355),
    user_id INT NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 4.4 Media
CREATE TABLE IF NOT EXISTS medias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    url TEXT NOT NULL,
    is_primary BOOLEAN DEFAULT false,
    display_order INTEGER,
    media_type enum('image','video'),
    entity_type ENUM('product', 'category', 'user', 'banner'),
    entity_id INT NOT NULL,
    -- No FK here because of polymorphic design
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 4.3 Categories
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    media_id INT NOT NULL,
    FOREIGN KEY (media_id)
        REFERENCES medias (id)
        ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 4.4 Products
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    stock INT UNSIGNED DEFAULT 0 CHECK (stock >= 0),
    price DECIMAL(10 , 2 ),
    discount_price DECIMAL(10 , 2 ),
    category_id INT NOT NULL,
    media_id INT NOT NULL,
    FOREIGN KEY (category_id)
        REFERENCES categories (id)
        ON DELETE CASCADE,
    FOREIGN KEY (media_id)
        REFERENCES medias (id)
        ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 4.5 Inventory
CREATE TABLE IF NOT EXISTS inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    quantity_available INT UNSIGNED DEFAULT 0 CHECK (quantity_available >= 0),
    product_id INT NOT NULL,
    FOREIGN KEY (product_id)
        REFERENCES products (id)
        ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 4.6 Cart
CREATE TABLE IF NOT EXISTS cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    quantity INT UNSIGNED DEFAULT 0 CHECK (quantity >= 0),  
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (product_id)
        REFERENCES products (id)
        ON DELETE CASCADE,
    FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 4.7 Coupons
CREATE TABLE IF NOT EXISTS coupons (
    id INT AUTO_INCREMENT PRIMARY KEY,           -- Primary key for the coupon, auto-incremented
    unique_code VARCHAR(255) NOT NULL UNIQUE,     -- Unique code for the coupon, cannot be NULL, must be unique
    expire_time INT,                             -- Expiry time for the coupon (this can be a Unix timestamp or any other numeric format)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,   -- Automatically set the current timestamp when the coupon is created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP   -- Automatically set the timestamp when the coupon is updated
);

-- 4.8 Orders
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    shipping_address_id INT,
    status VARCHAR(255),
    total_price DECIMAL(10 , 2 ),
    coupon_id INT,
    discount_amount DECIMAL(10 , 2 ),
    final_price DECIMAL(10 , 2 ),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE,
    FOREIGN KEY (shipping_address_id)
        REFERENCES shipping_addresses (id)
        ON DELETE CASCADE,
    FOREIGN KEY (coupon_id)
        REFERENCES coupons (id)
        ON DELETE CASCADE
);
-- ALTER TABLE orders 
-- ADD FOREIGN KEY (user_id) 
-- REFERENCES users(id) 
-- ON DELETE CASCADE;

-- ALTER TABLE orders 
-- ADD FOREIGN KEY (shipping_address_id) 
-- REFERENCES shipping_addresses(id) 
-- ON DELETE CASCADE;

-- ALTER TABLE orders 
-- ADD FOREIGN KEY (coupon_id) 
-- REFERENCES coupons(id) 
-- ON DELETE CASCADE;
SHOW CREATE TABLE orders;
-- 4.8 Order Items
CREATE TABLE IF NOT EXISTS order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    quantity INT UNSIGNED DEFAULT 0 CHECK (quantity >= 0),
    product_id INT NOT NULL,
    order_id INT NOT NULL,
    FOREIGN KEY (product_id)
        REFERENCES products (id)
        ON DELETE CASCADE,
    FOREIGN KEY (order_id)
        REFERENCES orders (id)
        ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 5. Insert Values 
/*
INSERT INTO users (email, password) 
VALUES 
('john.doe@example.com', 'hashedpassword123'),
('jane.smith@example.com', 'hashedpassword456'),
('alice.johnson@example.com', 'hashedpassword789');

 INSERT INTO shipping_addresses (address_line, user_id) 
VALUES 
('123 Main St, Springfield, IL', 1), 
('456 Oak Rd, Metropolis, NY', 2),
('789 Pine Ave, Gotham, NJ', 3);

INSERT INTO medias (url, is_primary, display_order, media_type, entity_type, entity_id) 
VALUES 
('https://example.com/product1.jpg', true, 1, 'image', 'product', 1),  -- Media for Product 1
('https://example.com/product2.jpg', false, 2, 'image', 'product', 2), -- Media for Product 2
('https://example.com/category1.jpg', true, 1, 'image', 'category', 1),  -- Media for Category 1
('https://example.com/category2.jpg', false, 2, 'image', 'category', 2); -- Media for Category 2

INSERT INTO categories (name, description, media_id) 
VALUES 
('Electronics', 'Latest electronic gadgets and devices', 1),
('Home Appliances', 'Tools and appliances for your home', 2),
('Fashion', 'Trendy and stylish clothing and accessories', 3);

INSERT INTO products (name, description, stock, price, discount_price, category_id, media_id) 
VALUES 
('Smartphone', 'A high-tech smartphone with amazing features', 50, 699.99, 649.99, 1, 1),
('Washing Machine', 'A durable washing machine with energy-saving features', 20, 499.99, 479.99, 2, 2),
('T-shirt', 'A trendy and comfortable cotton T-shirt', 100, 29.99, 19.99, 3, 3);

INSERT INTO inventory (quantity_available, product_id) 
VALUES 
(50, 1),  -- 50 units of Smartphone
(20, 2),  -- 20 units of Washing Machine
(100, 3); -- 100 units of T-shirt

INSERT INTO cart (quantity, product_id, user_id) 
VALUES 
(2, 1, 1),  -- 2 Smartphones in cart for User 1
(1, 2, 2),  -- 1 Washing Machine in cart for User 2
(3, 3, 3);  -- 3 T-shirts in cart for User 3

INSERT INTO coupons (unique_code, expire_time) 
VALUES 
('DISCOUNT10', 1672540799),  -- Expires on 2023-01-01
('SUMMER20', 1704067199);    -- Expires on 2023-12-31

INSERT INTO orders (user_id, shipping_address_id, status, total_price, coupon_id, discount_amount, final_price) 
VALUES 
(1, 1, 'Pending', 699.99, 1, 10.00, 689.99),  -- Order 1 for User 1 with 10% discount
(2, 2, 'Shipped', 499.99, 2, 20.00, 479.99), -- Order 2 for User 2 with 20% discount
(3, 3, 'Delivered', 29.99, NULL, 0.00, 29.99); -- Order 3 for User 3 with no discount

INSERT INTO order_items (quantity, product_id, order_id) 
VALUES 
(2, 1, 1),  -- 2 Smartphones in Order 1
(1, 2, 2),  -- 1 Washing Machine in Order 2
(3, 3, 3);  -- 3 T-shirts in Order 3
*/
/*
-- 1. Select all SELECT * FROM users;from users table


-- 2. Select all from shipping_addresses table
SELECT * FROM shipping_addresses;

-- 3. Select all from medias table
SELECT * FROM medias;

-- 4. Select all from categories table
SELECT * FROM categories;

-- 5. Select all from products table
SELECT * FROM products;

-- 6. Select all from inventory table
SELECT * FROM inventory;

-- 7. Select all from cart table
SELECT * FROM cart;

-- 8. Select all from coupons table
SELECT * FROM coupons;

-- 9. Select all from orders table
SELECT * FROM orders;

-- 10. Select all from order_items table
SELECT * FROM order_items;

*/

ALTER TABLE products MODIFY category_id INT;
DESC products;