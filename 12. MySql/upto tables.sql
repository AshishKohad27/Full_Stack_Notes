-- USE peopleData;
-- SELECT database();
-- INSERT INTO people(first_name,last_name,age)
-- VALUES ('Linda','Belcher',45),
--        ('Phillip','Frond',38),
-- 	   ('Calvin','Fischoeder',70);
--        
--        SELECT * FROM people; 

DROP TABLE employees;
CREATE TABLE employees(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100) NOT NULL, -- mandatory
last_name VARCHAR(100) NOT NULL,  -- mandatory
middel_name VARCHAR(100) NOT NULL,  -- mandatory
age INT,
current_status VARCHAR(100) DEFAULT 'employed'
);

DESC employees;
INSERT INTO employees(first_name,middel_name,last_name,age,current_status) VALUES('Ashish','Dinesh','Kohad',25,'not employed');
