CREATE database IF NOT EXISTS task_manager;

USE task_manager;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

DESC users;

-- INSERT INTO users (email) VALUES ('user01@gmail.com');

-- INSERT INTO tasks (title,description,user_id) VALUES ('Title 01','Description 01',1);

-- Insert 10 users
-- INSERT INTO users (email) VALUES
-- ('user1@example.com'),
-- ('user2@example.com'),
-- ('user3@example.com'),
-- ('user4@example.com'),
-- ('user5@example.com'),
-- ('user6@example.com'),
-- ('user7@example.com'),
-- ('user8@example.com'),
-- ('user9@example.com'),
-- ('user10@example.com');

-- Insert 20 tasks with random user assignments
-- INSERT INTO tasks (title,description,user_id) VALUES
-- ('Task 1', 'Description for task 1', 1),
-- ('Task 2', 'Description for task 2', 10),
-- ('Task 3', 'Description for task 3', 3),
-- ('Task 4', 'Description for task 4', 4),
-- ('Task 5', 'Description for task 5', 5),
-- ('Task 6', 'Description for task 6', 6),
-- ('Task 7', 'Description for task 7', 7),
-- ('Task 8', 'Description for task 8', 8),
-- ('Task 9', 'Description for task 9', 9),
-- ('Task 10', 'Description for task 10', 10),
-- ('Task 11', 'Description for task 11', 1),
-- ('Task 12', 'Description for task 12', 1),
-- ('Task 13', 'Description for task 13', 3),
-- ('Task 14', 'Description for task 14', 4),
-- ('Task 15', 'Description for task 15', 5),
-- ('Task 16', 'Description for task 16', 6),
-- ('Task 17', 'Description for task 17', 7),
-- ('Task 18', 'Description for task 18', 8),
-- ('Task 19', 'Description for task 19', 9),
-- ('Task 20', 'Description for task 20', 10);

SELECT * FROM users;


SELECT title, description, email FROM tasks JOIN users ON  tasks.user_id = users.id WHERE users.id='10';


