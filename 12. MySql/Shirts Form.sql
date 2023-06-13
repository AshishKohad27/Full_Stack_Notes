-- 1.
-- CREATE DATABASE shirt_db;

-- 2.
-- USE shirt_db;

-- 3.
-- CREATE TABLE shirts(
-- shirt_id INT AUTO_INCREMENT PRIMARY KEY,
-- article	VARCHAR(100),
-- color VARCHAR(100),
-- shirt_size VARCHAR(5),
-- last_worn INT
-- );

-- 4.
-- DESC shirts;

-- 5.
-- INSERT INTO shirts(article,color,shirt_size,last_worn)
-- VALUES ('t-shirt', 'white', 'S', 10),
-- ('t-shirt', 'green', 'S', 200),
-- ('polo shirt', 'black', 'M', 10),
-- ('tank top', 'blue', 'S', 50),
-- ('t-shirt', 'pink', 'S', 0),
-- ('polo shirt', 'red', 'M', 5),
-- ('tank top', 'white', 'S', 200),
-- ('tank top', 'blue', 'M', 15);

-- 6. Adding data;
-- INSERT INTO shirts(article,color,shirt_size,last_worn)
-- VALUES ('polo shirt','purple','M',50);

-- 7. SELECT all shirt (only Print Out Article and Color)
-- SELECT article, color FROM shirts;

-- 8. SELECT all medium shirt only ids
-- SELECT shirt_id AS id FROM shirts WHERE shirt_size='M';  

-- 9. Update all polo shirts Change their size to L;
-- update safe mode;
-- SET SQL_SAFE_UPDATES = 0;
-- SHOW VARIABLES LIKE "sql_safe_updates";
-- UPDATE shirts SET shirt_size="L"
-- WHERE article="polo shirt";

-- 10. Update shirt whose last worm 15 days --> to 0 days
-- SET SQL_SAFE_UPDATES=0;
-- SHOW VARIABLES LIKE "sql_safe_updates";
-- UPDATE shirts SET last_worn=0
-- WHERE last_worn=15;

-- 11. Update All white shirt changes sizeto 'XS' and color to "off white"
-- SET SQL_SAFE_UPDATES=0;
-- UPDATE shirts SET shirt_size="XS", color="Off white"
-- WHERE color="white";

-- 12. DELETE all old shirt whose last_worn = 200 days;
-- DELETE FROM shirts WHERE last_worn=200; 


-- 13. DELETE all tank tops
-- DELETE FROM shirts WHERE article="tank top";

-- 14. Delete all shirts;
-- DELETE FROM shirts;

-- 15. drop table
-- DROP TABLE shirts;

SELECT * FROM shirts;