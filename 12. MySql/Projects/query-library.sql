SELECT COUNT(*) AS total FROM borrow_records;

SELECT COUNT(*) AS total FROM borrow_records WHERE status = 'borrowed';

SELECT COUNT(*) AS total FROM borrow_records WHERE due_date < NOW() AND status = 'borrowed';

SELECT 
    b.id, b.title, COUNT(br.id) AS borrow_count
FROM
    books b
        JOIN
    borrow_records br ON b.id = br.book_id
GROUP BY b.id
ORDER BY borrow_count DESC;

SELECT 
    u.name, u.email, u.role, COUNT(br.id) AS borrow_count
FROM
    users u
        JOIN
    borrow_records br ON u.id = br.user_id
WHERE
    u.role = 'member'
GROUP BY u.id , u.name , u.email , u.role
ORDER BY borrow_count DESC
LIMIT 5;


SELECT 
    c.id, c.name as 'label', LOWER(REPLACE(TRIM(c.name)," ","_")) as 'key', COUNT(b.id) AS book_count
FROM
    categories c
        LEFT JOIN
    books b ON c.id = b.category_id
GROUP BY c.id , c.name;


SELECT * FROM categories;


SELECT 
    COUNT(*) AS total
FROM
    users
WHERE
    role = 'member';


