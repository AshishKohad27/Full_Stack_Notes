CREATE DATABASE IF NOT EXISTS jewellery_db;

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
    id INT PRIMARY KEY AUTO_INCREMENT,             -- Unique user ID
    name VARCHAR(100) NOT NULL,                    -- Full name of the user
    email VARCHAR(100) NOT NULL UNIQUE,            -- Unique email (prevents duplicate accounts)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- When user registered
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP                -- Auto update on modification
);

INSERT INTO users ( name, email)
VALUES ('SYSTEM', 'system@internal');


DESC roles;

SELECT * FROM roles;
