CREATE DATABASE IF NOT EXISTS jewellery_db;

CREATE DATABASE IF NOT EXISTS jewellery_dev;
CREATE DATABASE IF NOT EXISTS jewellery_test;
CREATE DATABASE IF NOT EXISTS jewellery_prod;

USE jewellery_test;


-- get role with user count
SELECT 
    r.id,
    r.name,
    r.description,
    r.isActive,
    COUNT(u.id) AS users_count
FROM roles r
LEFT JOIN users u ON u.role_id = r.id
GROUP BY r.id, r.name, r.description, r.isActive;


-- /analytics-customers
-- 1.Total Customers
SELECT COUNT(*) AS total FROM customers;

-- 2.Repeat Customers 2+ purchases

-- 2.1 with subsqueries
SELECT 
    *
FROM
    (SELECT 
        c.customer_name, COUNT(*) AS purchase_count
    FROM
        customers c
    JOIN sales s ON c.id = s.customer_id
    GROUP BY c.id , customer_name) t
WHERE
    t.purchase_count >= 2
ORDER BY t.purchase_count DESC;

-- 2.2 with HAVINGS
SELECT 
    c.customer_name, COUNT(*) AS purchase_count
FROM
    customers c
        JOIN
    sales s ON c.id = s.customer_id
GROUP BY c.id , customer_name
HAVING COUNT(*) >= 2
ORDER BY purchase_count DESC;


-- 3.High-Value Customers ₹5L+ lifetime spend
SELECT 
    c.id,
    c.customer_name,
    SUM(s.final_amount) AS lifetime_purchase,
    COUNT(*) AS purchase_count
FROM
    customers c
        JOIN
    sales s ON c.id = s.customer_id
GROUP BY c.id
HAVING SUM(s.final_amount) >= 500000
ORDER BY lifetime_purchase;

-- 4.Avg. Lifetime Value
SELECT 
    AVG(t.lifetime_purchase) AS 'Avg. Lifetime Value'
FROM
    (SELECT 
        c.id,
            c.customer_name,
            SUM(s.final_amount) AS lifetime_purchase,
            COUNT(*) AS purchase_count
    FROM
        customers c
    JOIN sales s ON c.id = s.customer_id
    GROUP BY c.id , c.customer_name) t;
    
-- 5. Purchase Frequency
SELECT 
    CASE
         WHEN t.purchase_count = 1 THEN "1_PURCHASE"
		 WHEN t.purchase_count >= 2 AND t.purchase_count <= 4 THEN "2_4_PURCHASE"
         WHEN t.purchase_count >= 5 AND t.purchase_count <= 9 THEN "5_9_PURCHASE"
         WHEN t.purchase_count >= 10 THEN "10_PURCHASE" 
         ELSE 'UNKNOWN'
    END AS purchase_frequency,
    COUNT(*)
FROM
    (SELECT 
        c.id, c.customer_name, COUNT(*) AS purchase_count
    FROM
        customers c
    JOIN sales s ON c.id = s.customer_id
    GROUP BY c.id , c.customer_name) t GROUP BY purchase_frequency;
    
    
    
SELECT 
    purchase_frequency,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 
        2
    ) AS percentage
FROM
(
    SELECT 
        CASE
            WHEN t.purchase_count = 1 THEN '1_PURCHASE'
            WHEN t.purchase_count BETWEEN 2 AND 4 THEN '2_4_PURCHASE'
            WHEN t.purchase_count BETWEEN 5 AND 9 THEN '5_9_PURCHASE'
            WHEN t.purchase_count >= 10 THEN '10_PURCHASE'
            ELSE 'UNKNOWN'
        END AS purchase_frequency
    FROM
    (
        SELECT 
            c.id,
            COUNT(*) AS purchase_count
        FROM customers c
        JOIN sales s ON c.id = s.customer_id
        GROUP BY c.id
    ) t
) final
GROUP BY purchase_frequency;

-- 6. Customer Growth - New Customers
SELECT *
FROM customers
WHERE created_at >= DATE_FORMAT(CURDATE(), '%Y-%m-01');

-- 6.1. Customer Growth - New Customers yearly
SELECT 
    DATE_FORMAT(created_at, '%Y') AS year,
    DATE_FORMAT(created_at, '%m') AS month,
    COUNT(*) AS total
FROM
    customers
WHERE
    created_at >= CURDATE() - INTERVAL 1 YEAR
        AND created_at <= CURDATE()
GROUP BY year , month
ORDER BY year , month;

-- 6.2. Customer Growth - Returning this yearly
SELECT 
    YEAR(s.sale_date) AS year,
    MONTH(s.sale_date) AS month,
    s.customer_id,
    COUNT(*) AS purchase_count
FROM
    sales s
WHERE
    s.sale_date >= CURDATE() - INTERVAL 1 YEAR
GROUP BY YEAR(s.sale_date) , MONTH(s.sale_date) , s.customer_id
HAVING COUNT(*) >= 2;

-- 7. High-Value Customers







    
SELECT * FROM customers;

SELECT * FROM sales s WHERE s.customer_id = 601;

SELECT * FROM sale_items;



SELECT 
    DATE_FORMAT(created_at, '%Y') AS year,
    DATE_FORMAT(created_at, '%m') AS month,
    COUNT(*) AS total
FROM
    customers
WHERE
    created_at >= CURDATE() - INTERVAL 1 YEAR
        AND created_at <= CURDATE()
GROUP BY year , month
ORDER BY year , month;


SELECT 
    DATE_FORMAT(t.sale_date, '%Y') AS year,
    DATE_FORMAT(t.sale_date, '%m') AS month,
    t.name,
    t.purchase_count AS purchase_count,
    t.sale_date AS sale_date
FROM
    (SELECT 
        c.id,
            c.customer_name AS name,
            COUNT(*) AS purchase_count,
            s.sale_date AS sale_date
    FROM
        sales s
    JOIN customers c ON s.customer_id = c.id
    GROUP BY c.customer_name , c.id
    HAVING COUNT(*) >= 2) t
WHERE
    sale_date >= CURDATE() - INTERVAL 1 YEAR
        AND sale_date <= CURDATE()
GROUP BY year , month
ORDER BY year , month;



    SELECT SUM(si.line_total - (ji.cost_price * si.weight_sold)) as total_profit
FROM sale_items si
JOIN jewellery_items ji ON si.jewellery_item_id = ji.id
JOIN sales s ON si.sale_id = s.id
WHERE s.status = 1;





