-- 1. Create Databases
CREATE DATABASE IF NOT EXISTS taza_chocolate;

-- 2. Use "taza_chocolate"
USE taza_chocolate;

-- 3. Select "taza_chocolate"
SELECT database();

-- 4. Create Table for "Category"
CREATE TABLE IF NOT EXISTS category(
	category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE
);
SHOW TABLES;

-- Col inside tables; 
DESC category;

-- 5. Values inside "category" Tables
INSERT ignore INTO category (category_name) VALUES
('gifts'),
('chocolate bars'),
('chocolate disc'),
('chocolate snacks');

-- 6. Read "category" Tables
SELECT * FROM category;





