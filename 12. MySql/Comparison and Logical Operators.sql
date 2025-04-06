 -- Summary 
-- 1. Show all DataBases 
-- show databases;

-- 2. Create DB
-- CREATE DATABASE IF NOT EXISTS book_shop;

-- 3. Drop DB
-- DROP DATABASE dog_site;

-- 4. Use DB: select DB so that we can do CRUD further.
-- use book_shop;

-- 5. Select DB: 
-- SELECT DATABASE();

-- 6. Table Creation inside DB : Model
-- CREATE TABLE books 
-- 	(
-- 		book_id INT AUTO_INCREMENT,
-- 		title VARCHAR(100),
-- 		author_fname VARCHAR(100),
-- 		author_lname VARCHAR(100),
-- 		released_year INT,
-- 		stock_quantity INT,
-- 		pages INT,
-- 		PRIMARY KEY(book_id)
-- 	);
--  
-- INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
-- VALUES
-- ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
-- ('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
-- ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
-- ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
-- ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
-- ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
-- ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
-- ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
-- ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
-- ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
-- ('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
-- ("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
-- ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
-- ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
-- ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
-- ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

-- 7. Show Tables
-- SHOW TABLES;

-- 8. Inside Tables
-- SHOW COLUMNS FROM books;
-- DESC books;

-- 9. Drop Table
-- DROP TABLE books;

-- 11. Showing all data inside table
-- SELECT * FROM books;

-- Logical and Comparison Operators
-- 1. Not Equal => !=
-- SELECT author_fname From books WHERE author_fname != 'Neil'; 

-- 2. Not Like
-- SELECT author_fname From books WHERE author_fname NOT LIKE '%neil%';
-- SELECT title,author_fname From books WHERE author_fname NOT LIKE 'da%';
-- SELECT title,author_fname From books WHERE author_fname NOT LIKE '%pa';
-- SELECT title,author_fname From books WHERE author_fname NOT LIKE '%a%';

-- 3. Greater Than
-- SELECT * FROM books WHERE released_year > 2000;
-- SELECT 99 > 1;
-- SELECT 99 < 1;

-- 4. Less Than Or Equal To
-- SELECT * FROM books WHERE released_year < 2000 order by released_year;
-- SELECT * FROM books WHERE released_year <= 2000 order by released_year;

-- 5. Logical AND
-- SELECT * FROM books WHERE author_lname='Eggers' AND released_year > 2010;
-- SELECT * FROM books WHERE author_lname='Eggers' AND released_year > 2010 AND title LIKE '%novel%';
-- SELECT * FROM books WHERE CHAR_LENGTH(title) > 30 AND pages > 500;

-- 6. Logical OR
-- SELECT * FROM books WHERE author_lname='Eggers' OR released_year > 2010;
-- SELECT * FROM books WHERE author_lname='Eggers' OR released_year > 2010 AND title LIKE '%novel%';
-- SELECT * FROM books WHERE author_lname='Eggers' AND (released_year > 2010 OR title LIKE '%novel%');
-- SELECT 1 < 5 OR 7 = 8 AND 9 < 1; => true AND has higher precedence than OR.

-- 7. Between
-- Need Books between 2004 to 2015
-- Method 1 
-- SELECT * FROM books WHERE released_year >= 2004 AND released_year <= 2015 ORDER BY released_year;
-- Method 2
-- SELECT * FROM books WHERE released_year BETWEEN 2004 AND 2015 ORDER BY released_year;
-- SELECT * FROM books WHERE pages BETWEEN 200 AND 300 ORDER BY pages;

-- 7. Not Between
-- SELECT * FROM books WHERE released_year NOT BETWEEN 2004 AND 2015 ORDER BY released_year;
-- SELECT * FROM books WHERE pages NOT BETWEEN 200 AND 300 ORDER BY pages;

-- 8. Date Comparision
-- SELECT * FROM people WHERE YEAR(birthdate) > 2005;
-- SELECT * FROM people WHERE HOuR(birthtime) > 9;
-- SELECT * FROM people WHERE birthtime BETWEEN CAST('12:00:00' AS TIME)  AND CAST('16:00:00' AS TIME);
-- SELECT * FROM people WHERE HOUR(birthtime) BETWEEN 12 AND 16;

-- 9. IN Operator
-- SELECT author_lname FROM books WHERE author_lname='Carver' OR author_lname='Lahiri' OR author_lname='Smith';
-- SELECT author_lname FROM books WHERE author_lname IN ('Carver','Lahiri','Smith');

-- 10. NOT IN Operator
-- SELECT author_lname FROM books WHERE author_lname NOT IN ('Carver','Lahiri','Smith');

-- 11. MODULO Operator
-- odd number 
-- SELECT * FROM books WHERE released_year % 2 != 0;
-- even number 
-- SELECT * FROM books WHERE released_year % 2 = 0;

-- 12. CASE
-- SELECT title, released_year,
-- 	CASE
-- 	   WHEN released_year>= 2000 THEN 'modern lit'
-- 	   ELSE '20th century lit'
-- 	END AS gener
-- FROM books

-- SELECT title, stock_quantity,
-- 	CASE
-- 		WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
--         WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
-- 		WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
--         WHEN stock_quantity BETWEEN 151 AND 200 THEN '****'
--         ELSE '*****'
-- 	END AS STOCK
-- FROM books ORDER BY stock_quantity;

-- SELECT 
--     title,
--     stock_quantity,
--     CASE
--         WHEN stock_quantity <= 40 THEN '*'
--         WHEN stock_quantity <= 70 THEN '**'
--         WHEN stock_quantity <= 100 THEN '***'
--         WHEN stock_quantity <= 140 THEN '****'
--         ELSE '*****'
--     END AS stock
-- FROM books ORDER BY stock_quantity;

-- 13. IS NULL
-- SELECT * FROM books WHERE author_lname IS NULL;

-- 14. IS NOT NULL
-- SELECT * FROM books WHERE author_lname IS NOT NULL;

-- Exercise
-- SELECT 10 != 10;
-- SELECT 15 > 14 AND 99 - 5 <= 94;
-- SELECT 1 IN (5 , 3) OR 9 BETWEEN 8 AND 10;

-- 4. Select all books written before 1980 (not inclusive)
-- SELECT author_lname, released_year FROM books WHERE released_year < 1980;

-- 5. Select all books written by Eggers OR Chabon;
-- SELECT author_lname, released_year FROM books WHERE author_lname LIKE '%eggers%' OR author_lname LIKE '%chabon%';
-- SELECT author_lname, released_year FROM books WHERE author_lname IN ('EGgeRs','ChaboN');

-- 6. Select all books written by Lahiri , published after 2000;
-- SELECT author_lname, released_year FROM books WHERE author_lname LIKE '%LaHiri%' AND released_year > 2000;

-- 7. Select all books with page counts between 100 and 200;
-- SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

-- 8. Select all books where author_lname starts with a 'C' or an 'S'
-- SELECT * FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';
-- SELECT * FROM books WHERE SUBSTR(author_lname, 1,1) IN ('C','S');

-- 9. If title contains 'stories' --> Short Stories , 'just kid' and 'a heartbreaking work' --> Memoir, everything else --> Novel
-- SELECT 
--     title,
--     author_lname,
--     CASE
--         WHEN title LIKE '%stories%' THEN 'Short Stories'
--         WHEN title LIKE '%just kid%' OR title LIKE '%a heartbreaking work%' THEN 'Memoir'
--         ELSE 'Novel'
--     END AS TYPE
-- FROM books;

-- 10. Make this happen
-- SELECT 
--     author_fname,
--     author_lname,
--     CASE
--         WHEN COUNT(*) = 1 THEN '1 book'
--         ELSE CONCAT(CAST(COUNT(*) AS CHAR), ' books')
--     END AS Count
-- FROM
--     books
-- WHERE
--     author_lname != ''
-- GROUP BY author_fname , author_lname;



