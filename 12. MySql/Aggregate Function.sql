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

-- Aggregate Function
-- 1. COUNT
-- SELECT COUNT(*) FROM books;
-- SELECT COUNT(author_fname) FROM books; // how many value present, its not count null value 

-- 2. DISTINCT
-- SELECT COUNT(DISTINCT author_fname) FROM books;
-- SELECT author_fname FROM books;
-- SELECT COUNT(DISTINCT released_year) FROM books;
-- SELECT COUNT(DISTINCT author_lname) FROM books;

-- How many title contain 'the' ?
-- SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

-- 3. GROUP BY : summarizes or aggregate identical data into single rows
-- SELECT author_lname FROM books GROUP BY author_lname;
-- Count how many books each author has written? 
-- SELECT author_lname,COUNT(*) FROM books GROUP BY author_lname;
-- ADVANCE
-- SELECT author_lname,COUNT(*) AS book_written FROM books GROUP BY author_lname ORDER BY book_written DESC;
-- Group by released_year
-- SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

-- 4. MIN & MAX
-- without GROUP BY
-- SELECT MIN(released_year) FROM books;
-- SELECT MIN(pages),MAX(pages) FROM books;
-- SELECT MIN(author_lname), MAX(author_lname) FROM books;

-- 5. Subqueries
-- SELECT * FROM books WHERE pages = (SELECT MAX(pages) FROM books);
-- Find title of the book released ealierest
-- SELECT title, released_year FROM books WHERE released_year = (SELECT MIN(released_year) FROM books);

-- 6. GROUP BY multiple column
-- SELECT author_fname, author_lname FROM books;
-- SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
-- SELECT CONCAT(author_fname, ' ', author_lname) AS author,  COUNT(*) FROM books GROUP BY author;


-- 7. MIN/MAX with GROUP BY
-- Find the year of each author published their first book
-- SELECT author_fname, author_lname, MIN(released_year), MAX(released_year), COUNT(*) FROM books  GROUP BY author_fname, author_lname;
-- SELECT 
-- 	author_lname, 
-- 	COUNT(*) as books_written, 
-- 	MAX(released_year) AS latest_release,
-- 	MIN(released_year)  AS earliest_release,
--       MAX(pages) AS longest_page_count
-- FROM books GROUP BY author_lname;

-- 8. SUM
-- SELECT SUM(pages) FROM books;
-- SELECT author_lname, SUM(pages)  FROM books GROUP BY author_lname;

-- 9. AVG
-- Calculate the average released_year across all books
-- SELECT AVG(released_year) FROM books;
-- Calculate the average stock quantity for books released in the same year
-- SELECT released_year, AVG(stock_quantity), COUNT(* ) FROM books GROUP BY released_year;

-- Exercise
-- 1. Print the number of books in the database
-- SELECT COUNT(*) FROM books;

-- 2. Print out how many books were released in each year
-- SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

-- 3. Print out the total number of books in stock
-- SELECT SUM(stock_quantity) FROM books;

-- 4. Find the average released_year for each author
-- SELECT author_fname, author_lname, AVG(released_year) FROM books GROUP BY author_fname, author_lname;

-- 5. Find the full name of the author who wrote the longest book
-- SELECT CONCAT(author_fname,' ',author_lname) AS full_name, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);

-- 6. Image
-- SELECT released_year AS year, COUNT(*) AS '# books', AVG(pages) as 'avg pages' FROM books GROUP BY year ORDER BY year;

