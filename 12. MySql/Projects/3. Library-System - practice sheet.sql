SELECT * FROM users ORDER BY name DESC LIMIT 3;
SELECT *
FROM (
  SELECT *
  FROM users
  LIMIT 3
) t
ORDER BY name DESC;

SELECT * FROM books;

DESC borrow_records;

SELECT 
    *
FROM
    borrow_records;


SELECT user_id FROM borrow_records ;

SELECT 
    u.id,
    u.member_id,
    u.name,
    u.email,
    COALESCE(SUM(br.status = 'borrowed'), 0) AS borrowed,
    COALESCE(SUM(br.status = 'returned'), 0) AS returned,
    COALESCE(SUM(br.status = 'overdue'), 0) AS overdue,
    CASE
        WHEN SUM(br.status = 'borrowed') = 0 THEN 'suspended'
        WHEN SUM(br.status = 'borrowed') > 0 THEN 'active'
        ELSE 'suspended'
    END AS status
FROM
    users u
        LEFT JOIN
    borrow_records br ON u.id = br.user_id
GROUP BY u.id , u.member_id , u.name , u.email
ORDER BY name DESC
LIMIT 30
;


SELECT *
FROM (
    SELECT 
        u.id,
        u.member_id,
        u.name,
        u.email,
        COALESCE(SUM(br.status = 'borrowed'), 0) AS borrowed,
        COALESCE(SUM(br.status = 'returned'), 0) AS returned,
        COALESCE(SUM(br.status = 'overdue'), 0) AS overdue,
        CASE
            WHEN SUM(br.status = 'borrowed') = 0 THEN 'suspended'
            ELSE 'active'
        END AS status
    FROM users u
    LEFT JOIN borrow_records br ON u.id = br.user_id
    GROUP BY u.id, u.member_id, u.name, u.email
    LIMIT 3
) t
ORDER BY t.name DESC;



SELECT 
    br.borrow_id,
    CONCAT(u.name, ' (', u.member_id, ')') AS member,
    b.title AS book_title,
	br.borrow_date,
    br.return_date,
    br.due_date,
    CASE
     -- 1️⃣ Returned
        WHEN br.return_date IS NOT NULL THEN 'returned'
        
        -- 2️⃣ Overdue (not returned and due date passed)
        WHEN br.return_date IS NULL AND br.due_date < NOW() THEN 'overdue'
        
        -- 3️⃣ Due soon (next 3 days)
        WHEN br.return_date IS NULL 
             AND br.due_date BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 3 DAY)
             THEN 'due soon'
        
        -- 4️⃣ Still active
        ELSE 'active'
    END AS status
FROM
    users u
        JOIN
    borrow_records br ON u.id = br.user_id
        JOIN
    books b ON b.id = br.book_id
    WHERE 1 = 1
   AND status = "active" LIMIT 10 OFFSET 0
;

 SELECT 
      COUNT(*)
    FROM
        users u
            JOIN
        borrow_records br ON u.id = br.user_id
            JOIN
        books b ON b.id = br.book_id
      WHERE 1 = 1;
      
      
      


-- Monthly Statistics
-- Total Borrows This Month 
SELECT * FROM borrow_records;
SELECT COUNT(*) FROM borrow_records;
SELECT *
FROM borrow_records
WHERE MONTH(borrow_date) = MONTH(CURDATE())
  AND YEAR(borrow_date) = YEAR(CURDATE());
  
-- Total Borrows in each months and year
SELECT 
  YEAR(borrow_date) AS year,
  MONTH(borrow_date) AS month,
  MONTHNAME(borrow_date) AS month_name,
  COUNT(*) AS total_borrows
FROM borrow_records
GROUP BY YEAR(borrow_date), MONTH(borrow_date)
ORDER BY year, month;
  
-- Returns This Month
SELECT 
    COUNT(*)
FROM
    borrow_records
WHERE
    return_date IS NOT NULL
        AND MONTH(return_date) = MONTH(CURDATE())
        AND YEAR(return_date) = YEAR(CURDATE());
        
-- Returns This Month    FOR FASTER RESULT
SELECT 
    COUNT(*) AS returns_this_month
FROM
    borrow_records
WHERE
    return_date IS NOT NULL
        AND return_date >= DATE_FORMAT(CURDATE(), '%Y-%m-01')
        AND return_date < DATE_ADD(DATE_FORMAT(CURDATE(), '%Y-%m-01'),
        INTERVAL 1 MONTH);


-- Returns This Month in each months and year
SELECT 
    YEAR(return_date) AS year,
    MONTH(return_date) AS month,
    MONTHNAME(return_date) AS month_name,
	COUNT(*) AS total_returns
FROM
    borrow_records
WHERE return_date IS NOT NULL
GROUP BY YEAR(return_date) , MONTH(return_date)
ORDER BY year , month;


-- New Members
SELECT * FROM users;
SELECT 
    COUNT(*)
FROM
    users
WHERE
    created_at IS NOT NULL
        AND MONTH(created_at) = MONTH(CURDATE())
        AND YEAR(created_at) = YEAR(CURDATE());
        
-- New Members    FOR FASTER RESULT      
SELECT 
    COUNT(*) AS new_members_this_month
FROM
    users
WHERE
    created_at >= DATE_FORMAT(CURDATE(), '%Y-%m-01')
        AND created_at < DATE_ADD(DATE_FORMAT(CURDATE(), '%Y-%m-01'),
        INTERVAL 1 MONTH);

        
        
-- New Members In each month and year
SELECT 
    YEAR(created_at) AS year,
    MONTH(created_at) AS month,
    MONTHNAME(created_at) AS month_name,
    COUNT(*) AS new_member_count
FROM
    users
GROUP BY YEAR(created_at) , MONTH(created_at)
ORDER BY year , month;


-- New Books Added
SELECT 
    COUNT(*)
FROM
    books
WHERE
    created_at IS NOT NULL
        AND MONTH(created_at) = MONTH(CURDATE())
        AND YEAR(created_at) = YEAR(CURDATE());
        
-- New Books Added      FOR FASTER RESULT
SELECT 
    COUNT(*) AS new_books_this_month
FROM
    books
WHERE
    created_at >= DATE_FORMAT(CURDATE(), '%Y-%m-01')
        AND created_at < DATE_ADD(DATE_FORMAT(CURDATE(), '%Y-%m-01'),
        INTERVAL 1 MONTH);


-- New Books Added In each month and year
SELECT 
    YEAR(created_at) AS year,
    MONTH(created_at) AS month,
    MONTHNAME(created_at) AS month_name,
    COUNT(*) AS new_book_count
FROM
    books
GROUP BY YEAR(created_at) , MONTH(created_at)
ORDER BY year , month;


-- Multiple Books on filter
SELECT * FROM users;
SELECT * FROM books;
SELECT * FROM categories;
SELECT 
    *
FROM
    books b
        JOIN
    categories c ON b.category_id = c.id
WHERE
    b.published_year >= 2010 AND b.published_year <= 2016;


-- Currently Borrowed Books user_id = 2
SELECT * FROM borrow_records br WHERE br.user_id = 2;
SELECT * FROM users u JOIN borrow_records br ON u.id = br.user_id WHERE u.id = 2;

SELECT 
    b.title, b.author, br.borrow_date, br.due_date, br.status
FROM
    books b
        JOIN
    borrow_records br ON b.id = br.book_id
WHERE
    br.user_id = 2 AND br.due_date < NOW() AND br.status != "returned";


-- Borrowing History user_id = 2
SELECT 
    b.title, b.author, br.borrow_date, br.due_date, br.status
FROM
    books b
        JOIN
    borrow_records br ON b.id = br.book_id
WHERE
    br.user_id = 2 AND br.due_date < NOW() AND br.status = "returned";
    
-- stats of user 
SELECT count(*) as total FROM borrow_records WHERE borrow_records.user_id = 2;

SELECT 
    COUNT(*) AS total
FROM
    borrow_records
WHERE
    return_date IS NULL
        AND due_date BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 3 DAY)
        AND borrow_records.user_id = 2;







