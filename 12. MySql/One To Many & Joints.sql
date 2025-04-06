-- Select the database to use
USE book_shop;

-- Create 'customers' table to store customer details
-- CREATE TABLE customers (
--     id INT PRIMARY KEY AUTO_INCREMENT, -- Unique ID for each customer
--     first_name VARCHAR(50), -- First name of the customer
--     last_name VARCHAR(50), -- Last name of the customer
--     email VARCHAR(50) -- Email of the customer
-- );

-- Create 'orders' table to store order details
-- CREATE TABLE orders (
--     id INT PRIMARY KEY AUTO_INCREMENT, -- Unique ID for each order
--     order_date DATE, -- Date when the order was placed
--     amount DECIMAL(8,2), -- Total order amount
--     customer_id INT, -- Customer who placed the order
--     FOREIGN KEY (customer_id) REFERENCES customers(id) -- Foreign key linking to customers table
-- );

-- Insert sample data into 'customers' table
-- INSERT INTO customers (first_name, last_name, email) 
-- VALUES ('Boy', 'George', 'george@gmail.com'),
--        ('George', 'Michael', 'gm@gmail.com'),
--        ('David', 'Bowie', 'david@gmail.com'),
--        ('Blue', 'Steele', 'blue@gmail.com'),
--        ('Bette', 'Davis', 'bette@aol.com');
--        
-- Insert sample data into 'orders' table
-- INSERT INTO orders (order_date, amount, customer_id)
-- VALUES ('2016-02-10', 99.99, 1),
--        ('2017-11-11', 35.50, 1),
--        ('2014-12-12', 800.67, 2),
--        ('2015-01-03', 12.50, 2),
--        ('1999-04-11', 450.25, 5);

-- Retrieve all orders
-- SELECT * FROM orders;

-- INNER JOIN: Fetch orders along with customer details
-- SELECT first_name, last_name, order_date, amount 
-- FROM customers 
-- JOIN orders ON customers.id = orders.customer_id;

-- INNER JOIN with GROUP BY: Get total spending per customer
-- SELECT first_name, last_name, SUM(amount) AS total 
-- FROM customers 
-- JOIN orders ON customers.id = orders.customer_id 
-- GROUP BY first_name, last_name 
-- ORDER BY total;

-- Try this: INNER JOIN Example
-- SELECT customers.first_name, customers.last_name, orders.order_date, orders.amount 
-- FROM customers 
-- INNER JOIN orders ON customers.id = orders.customer_id;

-- Try this: GROUP BY with INNER JOIN Example
-- SELECT customers.first_name, customers.last_name, SUM(orders.amount) AS total_spent 
-- FROM customers 
-- INNER JOIN orders ON customers.id = orders.customer_id 
-- GROUP BY customers.first_name, customers.last_name 
-- ORDER BY total_spent DESC;

-- LEFT JOIN: Get all customers and their orders (if any)
-- SELECT first_name, last_name, order_date, amount 
-- FROM customers 
-- LEFT JOIN orders ON customers.id = orders.customer_id;

-- LEFT JOIN with GROUP BY: Get total money spent per customer (including those with no orders)
-- SELECT 
--     first_name, 
--     last_name, 
--     IFNULL(SUM(amount), 0) AS money_spent -- Replace NULL values with 0 for customers with no orders
-- FROM customers
-- LEFT JOIN orders ON customers.id = orders.customer_id
-- GROUP BY first_name, last_name;

-- RIGHT JOIN: Fetch all orders and the corresponding customers (if any)
-- SELECT first_name, last_name, order_date, amount 
-- FROM customers 
-- RIGHT JOIN orders ON customers.id = orders.customer_id;

-- ON DELETE CASCADE: Dropping and recreating tables to enforce cascading delete
-- DROP TABLE orders;
-- DROP TABLE customers;

-- Recreate 'customers' table
-- CREATE TABLE customers (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     email VARCHAR(50)
-- );

-- Recreate 'orders' table with ON DELETE CASCADE constraint
-- CREATE TABLE orders (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     order_date DATE,
--     amount DECIMAL(8,2),
--     customer_id INT,
--     FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE -- Automatically delete orders when a customer is deleted
-- );

-- Reinsert customer data
-- INSERT INTO customers (first_name, last_name, email) 
-- VALUES ('Boy', 'George', 'george@gmail.com'),
--        ('George', 'Michael', 'gm@gmail.com'),
--        ('David', 'Bowie', 'david@gmail.com'),
--        ('Blue', 'Steele', 'blue@gmail.com'),
--        ('Bette', 'Davis', 'bette@aol.com');
--        
-- Reinsert order data
-- INSERT INTO orders (order_date, amount, customer_id)
-- VALUES ('2016-02-10', 99.99, 1),
--        ('2017-11-11', 35.50, 1),
--        ('2014-12-12', 800.67, 2),
--        ('2015-01-03', 12.50, 2),
--        ('1999-04-11', 450.25, 5);

-- Verify orders
-- SELECT * FROM orders;

-- Disable SQL safe updates to allow deletion
-- SET SQL_SAFE_UPDATES = 0;
-- SHOW VARIABLES LIKE "sql_safe_updates";

-- Delete a customer by last name (Example: 'George')
-- DELETE FROM customers WHERE last_name = "George";

-- Verify remaining orders after deletion
-- SELECT * FROM orders;


-- Exercise
-- DROP TABLE papers;
-- DROP TABLE students;

-- SCHEMA CREATION
-- CREATE TABLE IF NOT EXISTS students (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
--     first_name VARCHAR(50)
-- );

-- CREATE TABLE IF NOT EXISTS papers (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
--     title VARCHAR(100),
--     grade INT,
--     student_id INT,
--     FOREIGN KEY (student_id) REFERENCES students(id)
-- );

-- INSERT INTO students (first_name) VALUES 
-- ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
--  
-- INSERT INTO papers (student_id, title, grade ) VALUES
-- (1, 'My First Book Report', 60),
-- (1, 'My Second Book Report', 75),
-- (2, 'Russian Lit Through The Ages', 94),
-- (2, 'De Montaigne and The Art of The Essay', 98),
-- (4, 'Borges and Magical Realism', 89);

-- SELECT * from papers

-- Print 1
-- SELECT 
--     first_name, title, grade
-- FROM
--     students
--         JOIN
--     papers ON students.id = papers.student_id
-- ORDER BY grade DESC;

-- Print 2
-- SELECT 
--     first_name, title, grade
-- FROM
--     students
--         LEFT JOIN
--     papers ON students.id = papers.student_id
-- GROUP BY first_name , title;

-- Print 3
-- SELECT 
--     first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0)
-- FROM
--     students
--         LEFT JOIN
--     papers ON students.id = papers.student_id
-- GROUP BY first_name , title;

-- Print 4
-- SELECT 
--     first_name, IFNULL(AVG(grade), 0) AS average
-- FROM
--     students
--         LEFT JOIN
--     papers ON students.id = papers.student_id
-- GROUP BY first_name
-- ORDER BY average DESC;

-- Print 5
-- SELECT 
--     first_name,
--     IFNULL(AVG(grade), 0) AS average,
--     CASE
--         WHEN IFNULL(AVG(grade), 0) THEN 'PASSING'
--         ELSE 'FAILING'
--     END AS passing_status
-- FROM
--     students
--         LEFT JOIN
--     papers ON students.id = papers.student_id
-- GROUP BY first_name
-- ORDER BY average DESC;
