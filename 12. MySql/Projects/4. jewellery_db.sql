DROP DATABASE jewellery_test;

CREATE DATABASE IF NOT EXISTS jewellery_db;

CREATE DATABASE IF NOT EXISTS jewellery_dev;
CREATE DATABASE IF NOT EXISTS jewellery_test;
CREATE DATABASE IF NOT EXISTS jewellery_prod;

USE jewellery_db;

SHOW TABLES;

-- 1. roles
DROP TABLE roles;
CREATE TABLE IF NOT EXISTS roles (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(191) NOT NULL UNIQUE,
    description VARCHAR(255),
    isActive BOOLEAN NOT NULL DEFAULT TRUE,
    createdBy INT NOT NULL DEFAULT 1,
    updatedBy INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE roles ADD COLUMN description VARCHAR(255);

-- Show Tables
DESC roles;

INSERT INTO roles (
    name,
    description,
    is_active,
    created_by,
    updated_by
) VALUES
(
    'Super Admin',
    'Full system access, including settings, users, roles, and reports',
    TRUE,
    1,
    1
),
(
    'Admin',
    'Manages inventory, staff, customers, and sales',
    TRUE,
    1,
    1
),
(
    'Manager',
    'Oversees daily operations and approves discounts',
    TRUE,
    1,
    1
),
(
    'Sales Staff',
    'Creates sales, invoices, and manages customers',
    TRUE,
    1,
    1
),
(
    'Accountant',
    'Views financial reports and revenue analytics',
    TRUE,
    1,
    1
),
(
    'Inventory Manager',
    'Manages stock, inventory movements, and availability',
    TRUE,
    1,
    1
),
(
    'Auditor',
    'Read-only access for audit and compliance',
    TRUE,
    1,
    1
);


SELECT * FROM roles;

-- EMPTY
truncate TABLE roles;

-- query
SELECT COUNT(*) FROM roles  WHERE 1=1
AND name LIKE '%%'
ORDER BY name ASC
LIMIT 10 OFFSET 0
;


-- 2. users
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    pasword_hash TEXT NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    role_id INT NULL,
    last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id)
        REFERENCES roles (id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

DESC users;
SELECT * FROM users;
SELECT * FROM users JOIN roles ON users.role_id = roles.id;

INSERT INTO users (name, email, pasword_hash, role_id) VALUES
('Ashish Kohad', 'ashish.superadmin@example.com', 'Password@123', 1),
('Rohit Sharma', 'rohit.admin@example.com', 'Admin@123', 2),
('Priya Mehta', 'priya.manager@example.com', 'Manager@123', 3),
('Karan Patel', 'karan.sales@example.com', 'Sales@123', 4),
('Neha Verma', 'neha.sales@example.com', 'Sales@456', 4),
('Vikas Jain', 'vikas.account@example.com', 'Account@123', 5),
('Anita Desai', 'anita.inventory@example.com', 'Inventory@123', 6),
('Suresh Nair', 'suresh.audit@example.com', 'Audit@123', 7),
('Manish Gupta', 'manish.admin@example.com', 'Admin@456', 2),
('Sneha Kulkarni', 'sneha.manager@example.com', 'Manager@456', 3);


SELECT u.*, r.*
FROM users u
LEFT JOIN roles r ON u.role_id = r.id;


-- 3. suppliers
CREATE TABLE IF NOT EXISTS suppliers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100) NOT NULL UNIQUE,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DESC suppliers;
SELECT * FROM suppliers WHERE status = true AND supplier_name LIKE '%raj%';

-- 4. customers
CREATE TABLE IF NOT EXISTS customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100) NOT NULL UNIQUE,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO customers (customer_name, phone, email) VALUES
('Amit Sharma', '+919876543210', 'amit.sharma@example.com'),
('Neha Verma', '+919812345678', 'neha.verma@example.com'),
('Rohit Gupta', '+918888777666', 'rohit.gupta@example.com'),
('Priya Mehta', '+917654321098', 'priya.mehta@example.com'),
('Vikas Jain', '+919999888777', 'vikas.jain@example.com'),
('Sneha Kulkarni', '+918765432109', 'sneha.kulkarni@example.com'),
('Karan Patel', '+919701234567', 'karan.patel@example.com'),
('Anita Desai', '+919611223344', 'anita.desai@example.com'),
('Manish Gupta', '+918822334455', 'manish.gupta@example.com'),
('Suresh Nair', '+919455667788', 'suresh.nair@example.com'),
('Pooja Choudhary', '+919234567890', 'pooja.choudhary@example.com'),
('Rahul Singh', '+918123456789', 'rahul.singh@example.com'),
('Divya Iyer', '+917700112233', 'divya.iyer@example.com'),
('Arjun Reddy', '+919876001122', 'arjun.reddy@example.com'),
('Meera Nair', '+918855667799', 'meera.nair@example.com'),
('Sanjay Tiwari', '+919988776655', 'sanjay.tiwari@example.com'),
('Ritika Kapoor', '+919766554433', 'ritika.kapoor@example.com'),
('Nikhil Bansal', '+918877665544', 'nikhil.bansal@example.com'),
('Swati Agarwal', '+919655443322', 'swati.agarwal@example.com'),
('Yash Malhotra', '+918766554433', 'yash.malhotra@example.com'),
('Komal Shah', '+919544332211', 'komal.shah@example.com'),
('Harsh Vora', '+918655443322', 'harsh.vora@example.com'),
('Tanvi Joshi', '+919433221100', 'tanvi.joshi@example.com'),
('Aditya Kulkarni', '+918544332211', 'aditya.kulkarni@example.com'),
('Riya Bhatt', '+919322110099', 'riya.bhatt@example.com');

-- 6. metals
DESC metals;

-- 5. categories
CREATE TABLE IF NOT EXISTS categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    description TEXT,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
DESC categories;

INSERT INTO categories (category_name, description) VALUES
('Gold Jewellery', 'Jewellery made from gold including rings, chains, bangles, and necklaces'),
('Diamond Jewellery', 'Jewellery featuring diamonds such as rings, pendants, and bracelets'),
('Silver Jewellery', 'Jewellery made from silver including anklets, chains, and rings'),
('Platinum Jewellery', 'Premium jewellery crafted using platinum metal'),
('Bridal Collection', 'Special jewellery sets designed for weddings and bridal wear'),
('Daily Wear', 'Lightweight jewellery suitable for everyday use'),
('Men Jewellery', 'Jewellery designed specifically for men such as rings, chains, and bracelets'),
('Kids Jewellery', 'Jewellery designed for children with safe and lightweight materials'),
('Gemstone Jewellery', 'Jewellery containing precious and semi-precious gemstones'),
('Antique Jewellery', 'Traditional and heritage style jewellery designs');

-- 6. jewellery_items
CREATE TABLE IF NOT EXISTS jewellery_items (
    id INT NOT NULL AUTO_INCREMENT,
    item_code VARCHAR(50) NOT NULL,
    item_name VARCHAR(150) NOT NULL,

    category_id INT NULL,
    supplier_id INT NULL,

    metal_type VARCHAR(50) NULL,

    purity DECIMAL(5,2) NOT NULL,
    cost_price DECIMAL(12,2) NOT NULL,
    selling_price DECIMAL(12,2) NOT NULL,

    status BOOLEAN NOT NULL DEFAULT TRUE,

    created_by INT NOT NULL,
    updated_by INT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    UNIQUE KEY uq_item_code (item_code),

    -- Category Foreign Key
    CONSTRAINT fk_jewellery_category
        FOREIGN KEY (category_id)
        REFERENCES categories(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    -- Supplier Foreign Key
    CONSTRAINT fk_jewellery_supplier
        FOREIGN KEY (supplier_id)
        REFERENCES suppliers(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    -- Created By Foreign Key
    CONSTRAINT fk_jewellery_created_by
        FOREIGN KEY (created_by)
        REFERENCES users(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    -- Updated By Foreign Key
    CONSTRAINT fk_jewellery_updated_by
        FOREIGN KEY (updated_by)
        REFERENCES users(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

DESC jewellery_items;


INSERT INTO jewellery_items 
(item_code, item_name, category_id, supplier_id, metal_type, purity, cost_price, selling_price, created_by)
VALUES

('JWL001', 'Gold Bridal Necklace', 1, 1, 'Gold', 22.00, 120000, 135000, 1),
('JWL002', 'Diamond Engagement Ring', 2, 1, 'Gold', 18.00, 85000, 98000, 1),
('JWL003', 'Silver Anklet Pair', 3, 1, 'Silver', 92.50, 2500, 3500, 2),
('JWL004', 'Platinum Couple Rings', 4, 1, 'Platinum', 95.00, 65000, 78000, 2),
('JWL005', 'Gold Daily Wear Chain', 6, 1, 'Gold', 22.00, 42000, 48000, 3),
('JWL006', 'Men Gold Bracelet', 7, 1, 'Gold', 22.00, 55000, 63000, 3),
('JWL007', 'Kids Gold Earrings', 8, 1, 'Gold', 22.00, 18000, 22000, 4),
('JWL008', 'Ruby Gemstone Pendant', 9, 1, 'Gold', 18.00, 32000, 39000, 4),
('JWL009', 'Antique Temple Necklace', 10, 1, 'Gold', 22.00, 140000, 165000, 5),
('JWL010', 'Diamond Tennis Bracelet', 2, 1, 'Gold', 18.00, 90000, 110000, 5),

('JWL011', 'Silver Toe Rings', 3, 1, 'Silver', 92.50, 900, 1500, 6),
('JWL012', 'Platinum Wedding Band', 4, 1, 'Platinum', 95.00, 72000, 85000, 6),
('JWL013', 'Gold Mangalsutra', 5, 1, 'Gold', 22.00, 78000, 92000, 7),
('JWL014', 'Diamond Nose Pin', 2, 1, 'Gold', 18.00, 12000, 16000, 7),
('JWL015', 'Silver Bracelet', 3, 1, 'Silver', 92.50, 3000, 4500, 8),
('JWL016', 'Gold Hoop Earrings', 6, 1, 'Gold', 22.00, 25000, 30000, 8),
('JWL017', 'Emerald Gemstone Ring', 9, 1, 'Gold', 18.00, 45000, 52000, 9),
('JWL018', 'Antique Gold Bangles', 10, 1, 'Gold', 22.00, 110000, 130000, 9),
('JWL019', 'Men Platinum Chain', 7, 1, 'Platinum', 95.00, 88000, 102000, 10),
('JWL020', 'Kids Diamond Pendant', 8, 1, 'Gold', 18.00, 36000, 43000, 10);


-- Inventory Transcation
CREATE TABLE inventory_transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jewellery_item_id INT NOT NULL,
    transaction_type ENUM('PURCHASE','SALE','RETURN','ADJUSTMENT'),
    quantity_change INT DEFAULT 0,
    weight_change DECIMAL(10,2) DEFAULT 0.00,
    reference_id INT,
    reference_type VARCHAR(50),
    notes VARCHAR(255),
    created_by INT,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DESC inventory_transactions;

INSERT INTO inventory_transactions 
(jewellery_item_id, transaction_type, quantity_change, weight_change, reference_id, reference_type, notes, created_by)
VALUES
(1, 'PURCHASE', 10, 50.00, 101, 'PURCHASE', 'Initial stock purchase', 1),
(1, 'SALE', -2, -10.00, 201, 'SALE', 'Sold 2 items', 2),
(2, 'PURCHASE', 5, 25.50, 102, 'PURCHASE', 'Diamond rings purchase', 1),
(2, 'RETURN', 1, 5.10, 202, 'RETURN', 'Customer return', 3),
(3, 'PURCHASE', 20, 100.00, 103, 'PURCHASE', 'Silver stock purchase', 1),
(3, 'SALE', -5, -25.00, 203, 'SALE', 'Sold silver items', 2),
(4, 'PURCHASE', 8, 40.00, 104, 'PURCHASE', 'Platinum stock', 1),
(4, 'ADJUSTMENT', 0, -0.50, 301, 'ADJUSTMENT', 'Weight correction', 1),
(5, 'PURCHASE', 15, 75.00, 105, 'PURCHASE', 'Gold chains stock', 1),
(5, 'SALE', -3, -15.00, 204, 'SALE', 'Sold chains', 2);


SELECT * FROM inventory_transactions;

-- sales
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,

    invoice_number VARCHAR(50) UNIQUE,

    created_by INT NOT NULL,
    customer_id INT NOT NULL,

    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    gross_amount DECIMAL(14,2) NOT NULL DEFAULT 0,
    discount DECIMAL(14,2) NOT NULL DEFAULT 0,
    tax DECIMAL(14,2) NOT NULL DEFAULT 0,
    final_amount DECIMAL(14,2) NOT NULL DEFAULT 0,

    status BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_sales_created_by
        FOREIGN KEY (created_by)
        REFERENCES users(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_sales_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    INDEX idx_sales_customer (customer_id),
    INDEX idx_sales_date (sale_date)
);

DESC sales;

INSERT INTO sales 
(invoice_number, created_by, customer_id, gross_amount, discount, tax, final_amount)
VALUES
('INV-001',1,1,50000,2000,2400,50400),
('INV-002',2,2,75000,5000,3500,73500),
('INV-003',1,3,120000,0,6000,126000),
('INV-004',3,4,45000,1000,2200,46200),
('INV-005',1,5,98000,3000,4800,99800),
('INV-006',2,1,35000,0,1700,36700),
('INV-007',3,2,88000,2000,4300,90300),
('INV-008',1,3,64000,1500,3100,65600),
('INV-009',2,4,150000,5000,7200,152200),
('INV-010',1,5,27000,0,1300,28300),
('INV-011',3,1,92000,4000,4400,92400),
('INV-012',1,2,43000,1000,2100,44100),
('INV-013',2,3,67000,2000,3200,68200),
('INV-014',1,4,51000,0,2500,53500),
('INV-015',3,5,78000,3000,3800,78800),
('INV-016',1,1,46000,1500,2300,46800),
('INV-017',2,2,88000,4000,4200,88200),
('INV-018',3,3,99000,5000,4800,98800),
('INV-019',1,4,37000,1000,1800,37800),
('INV-020',2,5,112000,6000,5400,111400);


-- sale_items
CREATE TABLE sale_items (
    id INT AUTO_INCREMENT PRIMARY KEY,

    sale_id INT NOT NULL,
    jewellery_item_id INT NOT NULL,

    weight_sold DECIMAL(10,3) NOT NULL DEFAULT 0,
    price_at_sale DECIMAL(14,2) NOT NULL DEFAULT 0,
    line_total DECIMAL(14,2) NOT NULL DEFAULT 0,

    item_discount DECIMAL(14,2) NOT NULL DEFAULT 0,
    item_tax DECIMAL(14,2) NOT NULL DEFAULT 0,
	making_charges DECIMAL(14,2) NOT NULL DEFAULT 0,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_sale_items_sale
        FOREIGN KEY (sale_id)
        REFERENCES sales(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_sale_items_jewellery
        FOREIGN KEY (jewellery_item_id)
        REFERENCES jewellery_items(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    INDEX idx_sale_items_sale (sale_id),
    INDEX idx_sale_items_item (jewellery_item_id)
);

DESC sale_items;

INSERT INTO sale_items 
(sale_id, jewellery_item_id, weight_sold, price_at_sale, line_total)
VALUES
(1,1,5,10000,50000),
(2,2,3,25000,75000),
(3,3,6,20000,120000),
(4,4,2,22500,45000),
(5,5,4,24500,98000),
(6,6,2,17500,35000),
(7,7,4,22000,88000),
(8,8,3,21333,64000),
(9,9,5,30000,150000),
(10,10,2,13500,27000),

(11,1,4,23000,92000),
(12,2,2,21500,43000),
(13,3,3,22333,67000),
(14,4,3,17000,51000),
(15,5,4,19500,78000),
(16,6,2,23000,46000),
(17,7,4,22000,88000),
(18,8,5,19800,99000),
(19,9,2,18500,37000),
(20,10,4,28000,112000);


SELECT s.invoice_number, c.customer_name, si.jewellery_item_id, si.line_total
FROM sales s
JOIN customers c ON s.customer_id = c.id
JOIN sale_items si ON si.sale_id = s.id;


-- 7. permission
CREATE TABLE IF NOT EXISTS permissions (
    id INT NOT NULL AUTO_INCREMENT,

    name VARCHAR(100) NOT NULL,
    description VARCHAR(255) NULL,

    isActive BOOLEAN NOT NULL DEFAULT TRUE,

    createdBy INT NOT NULL DEFAULT 1,
    updatedBy INT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    UNIQUE KEY uq_permission_name (name),

    CONSTRAINT fk_permissions_createdBy
        FOREIGN KEY (createdBy)
        REFERENCES users(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_permissions_updatedBy
        FOREIGN KEY (updatedBy)
        REFERENCES users(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

DESC permissions;
truncate TABLE permissions;

INSERT INTO permissions (name, module, description) VALUES
-- USERS
('users.view', 'users', 'View users'),
('users.create', 'users', 'Create users'),
('users.update', 'users', 'Update users'),
('users.delete', 'users', 'Delete users'),

-- ROLES
('roles.view', 'roles', 'View roles'),
('roles.create', 'roles', 'Create roles'),
('roles.update', 'roles', 'Update roles'),
('roles.delete', 'roles', 'Delete roles'),

-- SUPPLIERS
('suppliers.view', 'suppliers', 'View suppliers'),
('suppliers.create', 'suppliers', 'Create suppliers'),
('suppliers.update', 'suppliers', 'Update suppliers'),
('suppliers.delete', 'suppliers', 'Delete suppliers'),

-- CUSTOMERS
('customers.view', 'customers', 'View customers'),
('customers.create', 'customers', 'Create customers'),
('customers.update', 'customers', 'Update customers'),
('customers.delete', 'customers', 'Delete customers'),

-- CATEGORIES
('categories.view', 'categories', 'View categories'),
('categories.create', 'categories', 'Create categories'),
('categories.update', 'categories', 'Update categories'),
('categories.delete', 'categories', 'Delete categories'),

-- JEWELLERY ITEMS
('jewellery_items.view', 'jewellery_items', 'View jewellery items'),
('jewellery_items.create', 'jewellery_items', 'Create jewellery items'),
('jewellery_items.update', 'jewellery_items', 'Update jewellery items'),
('jewellery_items.delete', 'jewellery_items', 'Delete jewellery items'),

-- SALES
('sales.view', 'sales', 'View sales'),
('sales.create', 'sales', 'Create sales'),
('sales.update', 'sales', 'Update sales'),
('sales.delete', 'sales', 'Delete sales');

SELECT * FROM permissions;

SET SQL_SAFE_UPDATES = 0;

UPDATE permissions
SET updated_at = CURRENT_TIMESTAMP
WHERE updated_at = '0000-00-00 00:00:00'
   OR updated_at IS NULL;


-- 8. role_permission

CREATE TABLE IF NOT EXISTS role_permissions (
    id INT NOT NULL AUTO_INCREMENT,

    role_id INT NOT NULL,
    permission_id INT NOT NULL,

    PRIMARY KEY (id),

    UNIQUE KEY uq_role_permission (role_id, permission_id),

    CONSTRAINT fk_role_permissions_role
        FOREIGN KEY (role_id)
        REFERENCES roles(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_role_permissions_permission
        FOREIGN KEY (permission_id)
        REFERENCES permissions(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Super Admin 
INSERT INTO role_permissions (role_id, permission_id)
SELECT 1, id FROM permissions;

--  Admin
INSERT INTO role_permissions (role_id, permission_id)
SELECT 2, id FROM permissions
WHERE name NOT IN ('role_delete');

-- Sales Staff
INSERT INTO role_permissions (role_id, permission_id)
SELECT 4, id FROM permissions
WHERE name IN (
    'customer_view',
    'customer_create',
    'sale_view',
    'sale_create',
    'item_view'
);

-- Accountant
INSERT INTO role_permissions (role_id, permission_id)
SELECT 5, id FROM permissions
WHERE name IN (
    'sale_view'
);

SELECT * FROM role_permissions;

-- Check Role Permissions Mapping
SELECT 
    r.name AS role_name,
    p.name AS permission
FROM role_permissions rp
JOIN roles r ON r.id = rp.role_id
JOIN permissions p ON p.id = rp.permission_id
ORDER BY r.name;

-- Test Single Role
SELECT p.name
FROM role_permissions rp
JOIN permissions p ON p.id = rp.permission_id
WHERE rp.role_id = 1;

SELECT * FROM permissions;



