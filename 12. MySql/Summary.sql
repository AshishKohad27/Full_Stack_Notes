-- Summary 
-- 1. Show all DataBases 
-- show databases;

-- 2. Create DB
-- CREATE DATABASE dog_site;

-- 3. Drop DB
-- DROP DATABASE dog_site;

-- 4. Use DB: select DB so that we can do CRUD further.
-- use dog_site;

-- 5. Select DB: 
-- SELECT DATABASE();

-- 6. Table Creation inside DB : Model
-- CREATE TABLE cats(
-- 	name VARCHAR(100),
-- 	age INT
-- );

-- 7. Show Tables
-- SHOW TABLES;

-- 8. Inside Tables
-- SHOW COLUMNS FROM cats;
-- DESC cats;

-- 9. Drop Table
-- DROP TABLE cats;


/* Inserting Data */

-- 10. Adding Data to your table
-- INSERT INTO cats(name,age) VALUES ('Jetson',7);

-- 11. Showing all data inside table
-- SELECT * FROM cats;

-- 12. Multi Insert Data inside Table
-- INSERT INTO cats(name,age)
-- VALUES ('charlie',10),
-- 	   ('sadie',3),
--        ('lazy bear',1);

-- 13. Not Null
-- CREATE TABLE cats2(
-- 	name VARCHAR(100) NOT NULL,
--     age INT NOT NULL
-- );
-- INSERT INTO cats2(name,age) VALUES ('Jetson',);
-- error : does not have a defaul value;

-- SELECT * FROM cats2;

-- 14. Default Value
-- CREATE TABLE cats3(
-- 	name VARCHAR(100) DEFAULT 'unnamed',
--  age INT DEFAULT 99
-- );
-- INSERT INTO cats3(name,age) VALUES ('',1);
-- SELECT * FROM cats3; 
-- DESC cats3;

-- 15. KEY: Primary key (Unique Identifier)
-- CREATE TABLE unique_cats(
-- 	cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(100),
--     age INT
-- );
-- DESC unique_cats;
-- INSERT INTO unique_cats(name,age)
-- VALUES ('charlie',10),
-- 	      ('sadie',3),
--        ('lazy bear',1);
-- SELECT * FROM unique_cats;

-- 16. Select particular field
-- SELECT name FROM unique_cats;

-- 17. Where
-- SELECT * FROM unique_cats WHERE age>=1;
-- SELECT * FROM unique_cats WHERE  name='cHaRliE';

-- 18. As : Set any field with any name by "as";
-- SELECT cat_id as hellocats_id,name as cats_name FROM unique_cats;

-- 19. Update : update safe mode;
-- SET SQL_SAFE_UPDATES = 0;
-- SHOW VARIABLES LIKE "sql_safe_updates";
-- UPDATE unique_cats SET age=100 WHERE age=1;

-- SELECT DATABASE();
-- use dog_site;
-- SHOW TABLES;
-- SELECT * FROM unique_cats;
-- -- DESC unique_cats;
