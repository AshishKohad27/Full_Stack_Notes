-- String Function

-- 1. create database
-- CREATE DATABASE book_shop;

-- 2. use database
-- USE book_shop;

-- 3. create table
-- CREATE TABLE books 
-- 	(
-- 		book_id INT NOT NULL AUTO_INCREMENT,
-- 		title VARCHAR(100),
-- 		author_fname VARCHAR(100),
-- 		author_lname VARCHAR(100),
-- 		released_year INT,
-- 		stock_quantity INT,
-- 		pages INT,
-- 		PRIMARY KEY(book_id)
-- 	);

-- 4. insert data into table 
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

-- 5. CONCAT(oneColumn , anotherColumn)
-- SELECT CONCAT(author_fname, ' ', author_lname) AS full_name FROM books;

-- 6. CONCAT_WS('-',onColumn,anotherColumn);
-- SELECT CONCAT_WS('-', author_fname, author_lname) AS full_name FROM books;

-- 7. SUBSTRING( string, from , lengthofSubstring )
-- SELECT SUBSTRING(title, 1, 25) FROM books;

-- 8. Combine CONCAT and SUBSTR
-- SELECT CONCAT(
--              SUBSTR(title, 1 ,9), 
--              '...' 
--              ) 
-- 	    AS "short title" 
-- FROM books;

-- 9. author_fname.author_lname.
-- SELECT SUBSTRING(author_fname,1,1),SUBSTRING(author_lname,1,1) FROM books;

-- SELECT 
--     CONCAT(SUBSTR(author_fname, 1, 1),
--             '.',
--             SUBSTR(author_lname, 1, 1),
--             '.') AS Initials
-- FROM
--     books;

-- 10. REPLACE( str, from_str, to_str );
-- SELECT REPLACE(title,' ' , '_') FROM books;

-- 11. REVERSE(str);
-- SELECT REVERSE(author_fname) FROM books;
-- SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

-- 12. CHAR_LENGTH(str)
-- SELECT CHAR_LENGTH(title) FROM books;

-- 13. UPPER or UCASE and LOWER or LCASE;
-- SELECT UPPER(title) FROM books;
-- SELECT UCASE(title) FROM books;

-- 14. I LOVE title !!!;
-- SELECT 
--     CONCAT('I LOVE', ' ', UCASE(title), ' ', '!!!')
-- FROM
--     books;

-- 15. INSERT(str,position,lengthToBeReplace,newStrWantToAdd);

-- 16. LEFT(str,length) / RIGHT(str,length)
-- SELECT 
--     LEFT(author_fname, 1) AS Left_A,
--     RIGHT(author_fname, 1) AS Right_A,
--     author_fname
-- FROM
--     books;

-- 17. REPEAT(str,numberOfTimes);
-- SELECT REPEAT('HA',4);

-- 18. TRIM( {LEADING | TRALING | BOTH} 'whatWeWantToRemove' FROM 'mainString);

-- Exercise

-- 1. reverse and uppercase
-- SELECT REVERSE(UCASE('Why does my cat look at me with such hatred'));

-- 2.
-- SELECT 
--     REPLACE(CONCAT('I', ' ', 'like', ' ', 'cats'),
--         ' ',
--         '-');

-- 3. REPLACE TITLE SPACE WITH ->
SELECT REPLACE(title, ' ', '->') AS title FROM books;

-- 4. last name named as forwords and reverse last name named as backwards 
-- SELECT 
--     author_lname AS forwords, REVERSE(author_lname) AS backwards
-- FROM
--     books;

-- 5. full name in CAPS;
-- SELECT 
--     CONCAT(UCASE(author_fname),
--             ' ',
--             UCASE(author_lname)) AS 'full name in caps'
-- FROM
--     books;

-- 6. title was released in year;
-- SELECT 
--     CONCAT(title,
--             ' was released in ',
--             released_year) AS blurb
-- FROM
--     books;

-- 7. Print books title and the length of each title
-- SELECT 
--     title, CHAR_LENGTH(title) AS 'character count'
-- FROM
--     books;

-- 8. short title... , author_lname,author_fname , quantity in stock
SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS 'short title',
    CONCAT_WS(',', author_lname, author_fname) AS author,
    CONCAT(stock_quantity, ' in stock')
FROM
    books	