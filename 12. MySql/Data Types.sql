-- Date and Time
-- CREATE TABLE people (
-- 	name VARCHAR(100),
--     birthdate DATE,
--     birthtime TIME,
--     birthdt DATETIME
-- );
 
-- INSERT INTO people (name, birthdate, birthtime, birthdt)
-- VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
--  
-- INSERT INTO people (name, birthdate, birthtime, birthdt)
-- VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
--  
-- INSERT INTO people (name, birthdate, birthtime, birthdt)
-- VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

-- SELECT * FROM people;


-- SELECT CURTIME();
--  
-- SELECT CURDATE();
--  
-- SELECT NOW();
 
-- INSERT INTO people (name, birthdate, birthtime, birthdt)
-- VALUES ('Hazel', CURDATE(), CURTIME(), NOW());


--- Date Function
-- SELECT 
--     birthdate,
--     DAY(birthdate),
--     DAYOFWEEK(birthdate),
--     DAYOFYEAR(birthdate)
-- FROM people;
--  
-- SELECT 
--     birthdate,
--     MONTHNAME(birthdate),
--     YEAR(birthdate)
-- FROM people;

--- Time Function
-- SELECT 
--     birthtime,
--     HOUR(birthtime),
--     MINUTE(birthtime)
-- FROM people;
--  
-- SELECT 
--     birthdt,
--     MONTH(birthdt),
--     DAY(birthdt),
--     HOUR(birthdt),
--     MINUTE(birthdt)
-- FROM people;

-- Date Formate
-- SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;
--  
-- SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;
--  
-- SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;	


-- UPdate and create at
CREATE TABLE captions (
--   text VARCHAR(150),
--   created_at TIMESTAMP default CURRENT_TIMESTAMP
-- );
--  
-- CREATE TABLE captions2 (
--   text VARCHAR(150),
--   created_at TIMESTAMP default CURRENT_TIMESTAMP,
--   updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
-- );

-- What's a good use case for CHAR?
 
-- Used for text that we know has a fixed length, e.g., State abbreviations, 
-- abbreviated company names, etc.
 
CREATE TABLE inventory (
    item_name VARCHAR(100),
    price DECIMAL(8,2),
    quantity INT
);
 
-- What's the difference between DATETIME and TIMESTAMP?
 
-- They both store datetime information, but there's a difference in the range, 
-- TIMESTAMP has a smaller range. TIMESTAMP also takes up less space. 
-- TIMESTAMP is used for things like meta-data about when something is created
-- or updated.
 
 
SELECT CURTIME();
 
SELECT CURDATE();
 
SELECT DAYOFWEEK(CURDATE());
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(), '%w') + 1;
 
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%W');
 
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');
 
SELECT DATE_FORMAT(NOW(), '%M %D at %k:%i');
 
CREATE TABLE tweets(
    content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');
SELECT * FROM tweets;
 
INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');
SELECT * FROM tweets;