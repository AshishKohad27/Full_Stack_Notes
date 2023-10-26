-- 1. Create DataBase
CREATE DATABASE IF NOT EXISTS getcooking; 

-- 2. Use That DB
use getcooking;

-- 3. Create Table for getCooking
CREATE TABLE IF NOT EXISTS auth(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150),
    email VARCHAR(150),
    password TEXT
);

-- 4. DESC 
DESC auth;

-- 5. Post Data
-- INSERT INTO auth(name,email,password) 
-- VALUE ("Ashish Kohad","ashish@getcooking,com","ashishkohad"); 
-- VALUE ("Rahul Kumar","rahul@getcooking,com","rahulkumar"); 

-- 6. Get All Data
-- SELECT * FROM auth;

-- 7. Get auth by name
-- SELECT * FROM auth WHERE name LIKE "%as%";

-- 8. Delect data base on id
-- DELETE FROM auth WHERE id="1";

-- 9. Update data base on id
-- UPDATE auth SET name="Rahul Kumar"
-- WHERE id="2";