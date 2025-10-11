-- 0. DROP DATABASE
DROP DATABASE library_system;

-- 📚 1. Create database (only if it doesn't exist)
CREATE DATABASE IF NOT EXISTS library_system;

-- Use the database
USE library_system;

-- 👤 2. Users table: Stores all users (admins & members)
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,             -- Unique user ID
    name VARCHAR(100) NOT NULL,                    -- Full name of the user
    email VARCHAR(100) NOT NULL UNIQUE,            -- Unique email (prevents duplicate accounts)
    password VARCHAR(255) NOT NULL,                -- Hashed password
    role ENUM('admin', 'member') DEFAULT 'member', -- User role (admin or member)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- When user registered
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP                -- Auto update on modification
);

-- 📂 3. Categories table: Stores book categories (Fiction, Science, etc.)
CREATE TABLE IF NOT EXISTS categories (
    id INT PRIMARY KEY AUTO_INCREMENT,            -- Unique category ID
    name VARCHAR(100) NOT NULL UNIQUE,            -- Category name (must be unique)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP
);

-- 📘 4. Books table: Stores all books in the library
CREATE TABLE IF NOT EXISTS books (
    id INT PRIMARY KEY AUTO_INCREMENT,              -- Unique book ID
    title VARCHAR(255) NOT NULL,                    -- Book title
    author VARCHAR(255) NOT NULL,                   -- Author name
    isbn VARCHAR(50) UNIQUE,                        -- Optional ISBN number (unique identifier for books)
    published_year INT NOT NULL,                    -- Year published
    total_copies INT NOT NULL CHECK (total_copies >= 0),           -- Total number of copies
    available_copies INT NOT NULL DEFAULT 0, -- Copies available for borrowing
    category_id INT,                                -- Foreign key to categories
    FOREIGN KEY (category_id) REFERENCES categories (id) 
        ON DELETE SET NULL                          -- If category is deleted, book category becomes NULL
        ON UPDATE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP
);

-- 📑 5. Borrow records: Tracks which user borrowed which book and when
CREATE TABLE IF NOT EXISTS borrow_records (
    id INT PRIMARY KEY AUTO_INCREMENT,               -- Unique borrow record ID
    user_id INT NOT NULL,                            -- User who borrowed the book
    book_id INT NOT NULL,                            -- Book borrowed
    borrow_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Date borrowed
    return_date DATETIME NULL,                       -- NULL = not returned yet
    due_date DATETIME NULL,                          -- Optional: expected return date
    status ENUM('borrowed', 'returned') DEFAULT 'borrowed', -- Current status of the record
    FOREIGN KEY (user_id) REFERENCES users (id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books (id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    INDEX(user_id),                                  -- Index for faster queries by user
    INDEX(book_id)                                   -- Index for faster queries by book
);

DESC users;
-- 6. Insert values
INSERT INTO users (name, email, password, role) VALUES
('Admin User', 'admin@library.com', 'hashedpwd001', 'admin'),
('Alice Johnson', 'alice@example.com', 'hashedpwd002', 'member'),
('Bob Smith', 'bob@example.com', 'hashedpwd003', 'member'),
('Charlie Brown', 'charlie@example.com', 'hashedpwd004', 'member'),
('Diana Miller', 'diana@example.com', 'hashedpwd005', 'member'),
('Ethan Carter', 'ethan@example.com', 'hashedpwd006', 'member'),
('Fiona Adams', 'fiona@example.com', 'hashedpwd007', 'member'),
('George Clark', 'george@example.com', 'hashedpwd008', 'member'),
('Hannah Davis', 'hannah@example.com', 'hashedpwd009', 'member'),
('Ian Evans', 'ian@example.com', 'hashedpwd010', 'member'),
('Julia Smith', 'julia.smith@example.com', 'hashedpwd011', 'member'),
('Kevin Green', 'kevin@example.com', 'hashedpwd012', 'member'),
('Laura Hill', 'laura@example.com', 'hashedpwd013', 'member'),
('Michael Johnson', 'michael@example.com', 'hashedpwd014', 'member'),
('Nina King', 'nina@example.com', 'hashedpwd015', 'member');

INSERT INTO categories (name) VALUES
('Fiction'),
('Science'),
('History'),
('Technology'),
('Philosophy'),
('Biography'),
('Art'),
('Travel'),
('Cooking'),
('Mystery'),
('Poetry'),
('Drama'); 

INSERT INTO books (title, author, isbn, published_year, total_copies, available_copies, category_id) VALUES
('To Kill a Mockingbird', 'Harper Lee', '9780060935467', 1960, 15, 10, 1),
('1984', 'George Orwell', '9780451524935', 1949, 12, 6, 1),
('Brave New World', 'Aldous Huxley', '9780060850524', 1932, 10, 5, 1),
('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 1925, 8, 3, 1),
('A Brief History of Time', 'Stephen Hawking', '9780553380163', 1988, 10, 7, 2),
('The Selfish Gene', 'Richard Dawkins', '9780198788607', 1976, 6, 4, 2),
('The Gene', 'Siddhartha Mukherjee', '9781476733500', 2016, 9, 5, 2),
('Sapiens', 'Yuval Noah Harari', '9780062316110', 2011, 14, 10, 3),
('Guns, Germs, and Steel', 'Jared Diamond', '9780393317558', 1997, 7, 5, 3),
('The Wright Brothers', 'David McCullough', '9781476728759', 2015, 8, 6, 3),
('Clean Code', 'Robert C. Martin', '9780132350884', 2008, 12, 9, 4),
('The Pragmatic Programmer', 'Andrew Hunt', '9780201616224', 1999, 10, 6, 4),
('Design Patterns', 'Erich Gamma', '9780201633610', 1994, 5, 3, 4),
('Refactoring', 'Martin Fowler', '9780201485677', 1999, 6, 4, 4),
('Meditations', 'Marcus Aurelius', '9780140449334', 180, 9, 7, 5),
('The Art of War', 'Sun Tzu', '9781599869773', -500, 10, 8, 5),
('The Story of My Experiments with Truth', 'Mahatma Gandhi', '9780807059098', 1927, 6, 5, 6),
('Steve Jobs', 'Walter Isaacson', '9781451648539', 2011, 7, 4, 6),
('The Picture of Dorian Gray', 'Oscar Wilde', '9780141439570', 1890, 4, 2, 7),
('The Divine Comedy', 'Dante Alighieri', '9780140448955', 1320, 3, 3, 5),
('Mastering the Art of French Cooking', 'Julia Child', '9780375413407', 1961, 5, 3, 9),
('Murder on the Orient Express', 'Agatha Christie', '9780062693662', 1934, 7, 5, 10),
('Leaves of Grass', 'Walt Whitman', '9780140421996', 1855, 5, 5, 11),
('Into the Wild', 'Jon Krakauer', '9780385486804', 1996, 6, 4, 8),
('The Mystery of the Blue Train', 'Agatha Christie', '9780007120825', 1928, 5, 3, 10);

INSERT INTO borrow_records (user_id, book_id, borrow_date, return_date, due_date, status) VALUES
(2, 1, '2025-09-01 10:00:00', '2025-09-10 15:00:00', '2025-09-15 23:59:59', 'returned'),
(3, 2, '2025-09-05 14:30:00', NULL, '2025-10-05 23:59:59', 'borrowed'),
(4, 3, '2025-09-15 09:00:00', '2025-09-20 11:00:00', '2025-09-30 23:59:59', 'returned'),
(5, 4, '2025-09-25 16:00:00', NULL, '2025-10-25 23:59:59', 'borrowed'),
(6, 5, '2025-09-28 12:00:00', NULL, '2025-10-20 23:59:59', 'borrowed'),
(7, 6, '2025-10-01 13:00:00', NULL, '2025-10-20 23:59:59', 'borrowed'),
(8, 7, '2025-10-02 11:00:00', '2025-10-07 12:00:00', '2025-10-15 23:59:59', 'returned'),
(9, 8, '2025-10-03 14:00:00', NULL, '2025-10-18 23:59:59', 'borrowed'),
(10, 9, '2025-10-04 16:00:00', NULL, '2025-10-20 23:59:59', 'borrowed'),
(2, 10, '2025-10-05 10:30:00', NULL, '2025-10-25 23:59:59', 'borrowed'),
(3, 11, '2025-10-01 09:00:00', NULL, '2025-10-15 23:59:59', 'borrowed'),
(4, 12, '2025-09-29 14:30:00', '2025-10-04 12:00:00', '2025-10-10 23:59:59', 'returned'),
(5, 13, '2025-10-04 10:00:00', NULL, '2025-10-20 23:59:59', 'borrowed'),
(6, 14, '2025-10-05 11:30:00', NULL, '2025-10-21 23:59:59', 'borrowed'),
(7, 15, '2025-10-06 09:00:00', NULL, '2025-10-22 23:59:59', 'borrowed'),
(8, 16, '2025-10-02 12:00:00', NULL, '2025-10-18 23:59:59', 'borrowed'),
(9, 17, '2025-09-25 13:00:00', '2025-10-05 14:00:00', '2025-10-10 23:59:59', 'returned'),
(10, 18, '2025-10-01 15:00:00', NULL, '2025-10-15 23:59:59', 'borrowed'),
(2, 19, '2025-09-20 10:00:00', NULL, '2025-10-05 23:59:59', 'borrowed'),
(3, 20, '2025-10-03 11:00:00', NULL, '2025-10-18 23:59:59', 'borrowed'),
(4, 21, '2025-10-04 09:30:00', NULL, '2025-10-20 23:59:59', 'borrowed'),
(5, 22, '2025-10-05 14:00:00', NULL, '2025-10-25 23:59:59', 'borrowed'),
(6, 23, '2025-10-06 16:00:00', NULL, '2025-10-22 23:59:59', 'borrowed'),
(7, 24, '2025-10-07 12:30:00', NULL, '2025-10-25 23:59:59', 'borrowed'),
(8, 15, '2025-09-30 10:00:00', '2025-10-05 12:00:00', '2025-10-12 23:59:59', 'returned');

-- 7. Drop Tables
-- DROP TABLE users;

-- A. Basic SELECT Queries
-- 1 Show all books in the library.
SELECT * FROM books;
-- 2 List all users who are members (not admins).
SELECT * FROM users WHERE role = 'member';
-- 3 Show all categories.
SELECT * FROM categories;
-- 4 Show all books published after 2010.
SELECT * FROM books WHERE published_year > 2010;

-- B. Filtering / Searching
-- 5. Find books where the author name contains “ROBERT”.
SELECT * FROM books WHERE author LIKE '%ROBERT%';
-- 6. List all books that have more than 5 copies available.
SELECT * FROM books WHERE available_copies > 5;
-- 7. Find all users whose email ends with @example.com.
SELECT * FROM users WHERE email LIKE '%@example.com%';

-- C. Joins / Relations
-- 8. List all books with their category name.
SELECT title, name FROM books JOIN categories ON category_id = categories.id;
-- 9. Show all borrowed books with the user’s name and borrow date.	
SELECT * FROM borrow_records JOIN users ON user_id = users.id WHERE status LIKE '%borrowed%';
-- 10. Show all books along with the number of times they have been borrowed.
SELECT *, SUM(amount) FROM borrow_records JOIN books ON user_id = books.id;

-- D. Aggregate Functions
-- 11. Count the total number of books in each category.
SELECT category_id, COUNT(category_id) FROM books GROUP BY category_id;
-- 12. Find the total number of borrowed books for each user.
SELECT user_id, COUNT(status) FROM borrow_records GROUP BY user_id;
SELECT * FROM borrow_records WHERE user_id='2';
-- 13. Find the average number of available copies per category.
SELECT category_id, AVG(available_Copies) 
FROM books 
GROUP BY category_id;
-- 13.1 include joins
SELECT 
	c.name AS category_name, 
	AVG(b.available_copies) AS avg_available_copies
FROM books b
JOIN categories c ON b.category_id = c.id
GROUP BY c.id, c.name;

-- E. Date Queries
-- 14. Show all books borrowed in the last 7 days.
SELECT * FROM borrow_records WHERE borrow_date >= NOW() - INTERVAL 7 DAY;
-- 14. Includes Joins
SELECT 
	b.title AS book_title,
    u.name AS user_name,
    br.borrow_date
FROM borrow_records br 
JOIN books b ON br.book_id = b.id
JOIN users u ON br.user_id = u.id
WHERE borrow_date >= NOW() - INTERVAL 7 DAY
ORDER BY br.borrow_date DESC;

-- 15. List users who have borrowed a book but not returned it yet.
SELECT DISTINCT
    u.id AS user_id,
    u.name AS user_name,
    u.email
FROM users u
JOIN borrow_records br ON u.id = br.user_id
WHERE br.status = 'borrowed';


-- 16. Show all books that are overdue (use due_date).
SELECT * FROM borrow_records WHERE due_date < NOW() AND status = 'borrowed';

-- F. Updates / Inserts / Deletes
-- 17. Update the available copies of a book after it is borrowed.
-- 18. Mark a borrow record as returned and set the return_date.
-- 19. Add a new book to the library.
-- 20. Delete a category (and decide what happens to its books).

-- G. Advanced / Challenge
-- 21. Show the top 3 most borrowed books.
SELECT * FROM borrow_records;
SELECT book_id,  COUNT(*) AS total_borrows FROM borrow_records GROUP BY book_id ORDER BY total_borrows DESC LIMIT 3;

-- 22. Show the user who borrowed the most books.
-- 23. Show all categories that don’t have any books.
-- 24. Show all books that were never borrowed.
