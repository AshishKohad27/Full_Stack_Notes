-- INSTEAD OF TYPING THIS QUERY ALL THE TIME...
-- SELECT 
--     title, released_year, genre, rating, first_name, last_name
-- FROM
--     reviews
--         JOIN
--     series ON series.id = reviews.series_id
--         JOIN
--     reviewers ON reviewers.id = reviews.reviewer_id;
 
-- WE CAN CREATE A VIEW:
-- CREATE VIEW full_reviews AS
--     SELECT 
--         title, released_year, genre, rating, first_name, last_name
--     FROM
--         reviews
--             JOIN
--         series ON series.id = reviews.series_id
--             JOIN
--         reviewers ON reviewers.id = reviews.reviewer_id;
 
-- NOW WE CAN TREAT THAT VIEW AS A VIRTUAL TABLE 
-- (AT LEAST WHEN IT COMES TO SELECTING)
-- SELECT * FROM full_reviews;

-- CREATE OR REPLACING VIEWS
-- CREATE VIEW order_series AS SELECT * FROM series ORDER BY released_year;
-- CREATE OR REPLACE VIEW order_series AS SELECT * FROM series ORDER BY released_year DESC;
-- ALTER VIEW order_series AS SELECT * FROM series ORDER BY released_year;
-- SELECT * FROM order_series;

-- DROP VIEW
-- DROP VIEW order_series; 

-- HAVING clause
-- SELECT 
--     title, 
--     AVG(rating),
--     COUNT(rating) AS review_count
-- FROM full_reviews 
-- GROUP BY title HAVING COUNT(rating) > 1;


-- WITH ROLLUP
-- SELECT 
--     title, 
--     AVG(rating),
--     COUNT(rating) AS review_count
-- FROM full_reviews 
-- GROUP BY title WITH ROLLUP ;
