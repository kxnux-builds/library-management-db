-- ==========================================
-- Library Management System
-- ==========================================

DROP DATABASE IF EXISTS LibraryDB;
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- ==========================================
-- Authors Table
-- ==========================================

CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

-- ==========================================
-- Categories Table
-- ==========================================

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- ==========================================
-- Books Table
-- ==========================================

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    publish_year YEAR NOT NULL,
    author_id INT,
    category_id INT,

    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE CASCADE
);

-- ==========================================
-- Members Table
-- ==========================================

CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    join_date DATE NOT NULL
);

-- ==========================================
-- Borrow Table
-- ==========================================

CREATE TABLE Borrow (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE,

    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);

-- ==========================================
-- Insert Sample Data
-- ==========================================

INSERT INTO Authors(author_name, country)
VALUES
('J.K. Rowling', 'UK'),
('George Orwell', 'UK');

INSERT INTO Categories(category_name)
VALUES
('Fantasy'),
('Novel'),
('Education');

INSERT INTO Books(title, isbn, publish_year, author_id, category_id)
VALUES
('Harry Potter', '9780747532743', 1997, 1, 1),
('1984', '9780451524935', 1949, 2, 2);


INSERT INTO Members(member_name, phone, email, join_date)
VALUES
('Raj Roy', '9876543210', 'raj009@gmail.com','2026-02-10'),
('Anirban Das', '9876543211', 'ani2005@gmail.com','2026-04-19');

INSERT INTO Borrow(member_id, book_id, borrow_date, return_date)
VALUES
(1, 1, '2026-02-10', '2026-03-09'),
(2, 2, '2026-04-19', '2026-05-18');

-- ==========================================
-- Display Data
-- ==========================================

SELECT * FROM Authors;
SELECT * FROM Categories;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Borrow;

-- =============================================
-- END OF PROJECT
-- =============================================