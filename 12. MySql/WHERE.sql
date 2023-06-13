-- USE pet_shop;
-- SHOW TABLES;
-- DESC cats;
-- DROP TABLE cats;

-- CREATE TABLE cats(
-- cats_id INT AUTO_INCREMENT,
-- name VARCHAR(100),
-- breed VARCHAR(100),
-- age INT,
-- PRIMARY KEY (cats_id)
-- );

-- INSERT INTO cats(name,breed,age)
-- VALUES ('Ringo', 'Tabby', 4),
--        ('Cindy', 'Maine Coon', 10),
--        ('Dumbledore', 'Maine Coon', 11),
--        ('Egg', 'Persian', 4),
--        ('Misty', 'Tabby', 13),
--        ('George Michael', 'Ragdoll', 9),
--        ('Jackson', 'Sphynx', 7);
       
-- SELECT * FROM cats;
-- 1. cats_id
-- SELECT cats_id FROM cats;

-- 2. name breed
-- SELECT name,breed FROM cats;

-- 3. only breed
-- SELECT name,age FROM cats WHERE breed="tabby"; 

-- 4. cats_id === age
-- SELECT * FROM cats WHERE cats_id=age;

-- 5. AS --> cats_id => id
-- SELECT cats_id AS id,  name FROM cats;

-- 6. UPDATE
-- UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';
-- UPDATE cats SET breed="Tabby" WHERE breed="Shorthair";
-- SELECT * FROM cats;
-- SET SQL_SAFE_UPDATES = 0;
-- SHOW VARIABLES LIKE "sql_safe_updates";

-- 7. Exercise
-- 7.1
-- UPDATE cats SET name="Jack" WHERE name="Jackson";
-- 7.2
-- UPDATE cats SET breed="British Shorthair" WHERE name="Ringo";
-- 7.3
UPDATE cats SET age="12" WHERE breed="Maine Coon";
SELECT * FROM cats;