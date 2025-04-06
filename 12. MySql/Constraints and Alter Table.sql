-- Step 1: Select the database to use
USE book_shop;

-- Step 2: Create the `contacts` table if it does not already exist
-- CREATE TABLE IF NOT EXISTS contacts (
--     id INT AUTO_INCREMENT PRIMARY KEY,  -- Adding an ID as the primary key for uniqueness
--     name VARCHAR(100) NOT NULL,         -- Name of the contact (cannot be NULL)
--     mobile VARCHAR(10) NOT NULL UNIQUE  -- Mobile number (must be unique and not NULL)
-- );

-- Step 3: Describe the table structure to verify its creation
-- DESC contacts;

-- Step 4: Insert sample data into the `contacts` table
-- INSERT INTO contacts (name, mobile)
-- VALUES ('Ashish', '9876543210');

-- Step 5: Retrieve all records from the `contacts` table
-- SELECT * FROM contacts;

-- 2. Check Constraints

-- Step 2: Create the `partiers` table if it does not already exist
-- CREATE TABLE IF NOT EXISTS partiers (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(50),
--     age INT CHECK (age > 18)
-- );

-- Step 3: Describe the table structure to verify its creation
-- DESC contacts;

-- Step 4: Insert sample data into the `contacts` table
-- INSERT INTO partiers (name, age)
-- VALUES ('Ashish', '28');
-- INSERT INTO partiers (name, age)
-- VALUES  ('Rahul', '19');
-- INSERT INTO partiers (name, age)
-- VALUES ('ankit', '10');	
       
-- Step 5: Retrieve all records from the `contacts` table
-- SELECT * FROM partiers;

-- Step 2: Create the `palindromes` table if it does not already exist
-- CREATE TABLE IF NOT EXISTS palindromes (
--    word VARCHAR(100) CHECK(REVERSE(word) = word)
-- );

-- Step 4: Insert sample data into the `palindromes` table
-- INSERT INTO palindromes (word)
-- VALUES ('racecar');
-- VALUES ('ashish');

-- Step 5: Retrieve all records from the `palindromes` table
-- SELECT * FROM palindromes;

-- 3. NAMED Constraints

-- Step 2: Create the `partiers2` table if it does not already exist
-- CREATE TABLE IF NOT EXISTS partiers2 (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(50),
--     age INT,
--     CONSTRAINT age_over_18 CHECK (age > 18)
-- );

-- Step 4: Insert sample data into the `partiers2` table
-- INSERT INTO partiers2 (name, age)
-- VALUES ('Ashish', '28');
-- VALUES  ('Rahul', '19');
-- VALUES ('ankit', '10');	

-- Step 5: Retrieve all records from the `partiers2` table
-- SELECT * FROM partiers2;


-- 4. Multi Column
-- CREATE TABLE companies (
--     name VARCHAR(255) NOT NULL,
--     address VARCHAR(255) NOT NULL,
--     CONSTRAINT name_address UNIQUE (name , address)
-- );
--  
-- CREATE TABLE houses (
--   purchase_price INT NOT NULL,
--   sale_price INT NOT NULL,
--   CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
-- );

-- 5. Alter Table: Add Column
-- ALTER TABLE companies ADD COLUMN  city  VARCHAR(25);
-- ALTER TABLE companies ADD COLUMN  employee_count INT NOT NULL DEFAULT 1;


-- 6. Alter Table: Drop Column
-- ALTER TABLE companies DROP COLUMN city;

-- 7. Renaming Table
-- RENAME TABLE companies TO suppliers;
-- ALTER TABLE suppliers RENAME TO companies;

-- 8. Renaming Column of Table
-- ALTER TABLE companies RENAME COLUMN name TO company_name;
-- SELECT VERSION();

-- SELECT * FROM companies; 

-- 9. MODIFY
--  ALTER TABLE companies MODIFY name VARCHAR(225);
-- ALTER TABLE companies MODIFY name VARCHAR(100) DEFAULT 'unknown';
-- DESC companies;

-- 10. Alter Table: Constarints
-- ALTER TABLE houses ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);
-- ALTER TABLE houses DROP CONSTRAINT positive_pprice;









