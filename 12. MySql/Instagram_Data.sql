-- 1. Create DataBase
-- CREATE DATABASE IF NOT EXISTS ig_clone;

-- 2. Use Database
-- USE ig_clone;

-- Schema Creation
-- 1. Users
-- CREATE TABLE IF NOT EXISTS users (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     username VARCHAR(255) NOT NULL,
--     created_at TIMESTAMP DEFAULT NOW()
-- );

-- 1.1 Insert Data
-- INSERT INTO users(username) VALUES('ashishkohad'), ('blue_cat');
-- SELECT * FROM users;
-- DESC users;

-- 2. Photos
-- CREATE TABLE IF NOT EXISTS photos (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     image_url VARCHAR(1000) NOT NULL,
--     created_at TIMESTAMP DEFAULT NOW(),
--     user_id INT NOT NULL,
--     FOREIGN KEY (user_id)
--         REFERENCES users (id)
-- );

-- 2.1 Alter 
-- ALTER TABLE photos MODIFY user_id INT NOT NULL;

-- 2.2 Insert Data
-- DESC photos;
-- INSERT INTO photos(image_url,user_id) VALUES('/adayfas4654',1), ('/567asfas52fjah',2);
-- SELECT username, image_url FROM photos JOIN users ON photos.user_id = users.id;

-- 3 Comments
-- CREATE TABLE IF NOT EXISTS comments (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     created_at TIMESTAMP DEFAULT NOW(),
--     comment_text VARCHAR(255) NOT NULL,
--     user_id INT NOT NULL,
--     photo_id INT NOT NULL,
--     FOREIGN KEY (user_id)
--         REFERENCES users (id),
--     FOREIGN KEY (photo_id)
--         REFERENCES photos (id)
-- );

-- 2.2 Insert Data
-- DESC comments;
-- INSERT INTO comments(comment_text,user_id,photo_id) VALUES('nice photos','1','2'),('greate work','2','1');
-- INSERT INTO comments(comment_text,user_id,photo_id) VALUES('nice work bro','1','1');
-- SELECT 
--     username, image_url, comment_text
-- FROM
--     comments
--         JOIN
--     users ON comments.user_id = users.id
--         JOIN
--     photos ON comments.photo_id = photos.id
-- ; 

-- 4. LIKE 
-- CREATE TABLE IF NOT EXISTS likes (
--     created_at TIMESTAMP DEFAULT NOW(),
--     user_id INT NOT NULL,
--     photo_id INT NOT NULL,
--     FOREIGN KEY (user_id)
--         REFERENCES users (id),
--     FOREIGN KEY (photo_id)
--         REFERENCES photos (id),
--     PRIMARY KEY (user_id , photo_id)
-- );

-- 4.1 Insert Data
-- DESC likes;
-- INSERT INTO likes(user_id,photo_id) VALUES(1,2);
-- SELECT * FROM likes;
--  -- SELECT 
--     users.id AS user_id,
--     photos.id AS photo_id,
--     username,
--     image_url
-- FROM
--     likes
--         JOIN
--     users ON likes.user_id
--         JOIN
--     photos ON likes.photo_id = photos.id;

-- 5. Follows
-- CREATE TABLE IF NOT EXISTS follows (
--     follower_id INT NOT NULL,
--     followee_id INT NOT NULL,
--     created_at TIMESTAMP DEFAULT NOW(),
--     FOREIGN KEY (follower_id)
--         REFERENCES users (id),
--     FOREIGN KEY (followee_id)
--         REFERENCES users (id),
--     PRIMARY KEY (follower_id , followee_id)
-- );

-- 5.1 Insert
-- DESC follows;
-- INSERT INTO follows(follower_id,followee_id) VALUES(1,2);
-- SELECT *, username AS followees FROM follows JOIN users ON follows.followee_id = users.id;

-- 6. tags
-- CREATE TABLE IF NOT EXISTS tags (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     tag_name VARCHAR(255) NOT NULL UNIQUE,
--     create_at TIMESTAMP DEFAULT NOW()
-- );

-- 6.1 Insert
-- DESC tags;
-- INSERT INTO tags(tag_name) VALUES ('#nice'),('#bro'),('#amazing');
-- SELECT * FROM tags;	

-- 7. Photo tag
-- CREATE TABLE IF NOT EXISTS photo_tags (
--     photo_id INT NOT NULL,
--     tag_id INT NOT NULL,
--     FOREIGN KEY (photo_id)
--         REFERENCES photos (id),
--     FOREIGN KEY (tag_id)
--         REFERENCES tags (id),
--     PRIMARY KEY (photo_id , tag_id)
-- );

-- 7.1 Insert
-- DESC photo_tags;



