-- #1 STUDENTS TABLE
CREATE TABLE IF NOT EXISTS students (
    -- Primary key
    student_id INT AUTO_INCREMENT PRIMARY KEY,

    -- Student name
    student_first_name VARCHAR(50) NOT NULL,
    student_last_name VARCHAR(50) NOT NULL,

    -- Student course
    student_course VARCHAR(50) NOT NULL,

    -- Created timestamp
    student_created_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


-- #2 BOOKS TABLE
CREATE TABLE IF NOT EXISTS books (
    -- Primary key
    book_id INT AUTO_INCREMENT PRIMARY KEY,

    -- Book details
    book_title VARCHAR(100) NOT NULL,
    book_author VARCHAR(100) NOT NULL,
    book_category VARCHAR(50) NOT NULL,

    -- Created timestamp
    book_created_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


-- #3 BORROW TABLE
CREATE TABLE IF NOT EXISTS borrow (
    -- Primary key
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,

    -- Foreign keys
    student_id INT NOT NULL,
    book_id INT NOT NULL,

    -- Borrow timestamp
    borrow_date TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    -- Return timestamp
    borrow_return_date TIMESTAMP NULL
        DEFAULT NULL,

    -- Student foreign key
    CONSTRAINT fk_borrow_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    -- Book foreign key
    CONSTRAINT fk_borrow_book
        FOREIGN KEY (book_id)
        REFERENCES books(book_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


-- #4 INSERT STUDENTS
INSERT INTO students (
    student_first_name,
    student_last_name,
    student_course
) VALUES
('WAHIV', 'PAQUIBOT', 'BSIT'),
('JUSHUA', 'BACO', 'BSCRIM'),
('NHESAN', 'BABOL', 'BSBA'),
('JOHN XYREX', 'SISTOSO', 'BSTCM');


-- #5 INSERT BOOKS
INSERT INTO books (
    book_title,
    book_author,
    book_category
) VALUES
('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Fantasy'),
('The Alchemist', 'Paulo Coelho', 'Fiction'),
('To Kill a Mockingbird', 'Harper Lee', 'Classic'),
('Noli Me Tangere', 'Jose Rizal', 'Classic');


-- #6 INSERT BORROW RECORDS
INSERT INTO borrow (
    student_id,
    book_id
) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);