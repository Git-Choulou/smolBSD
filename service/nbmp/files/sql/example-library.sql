-- smolBSD 'nbmp' service sql file example.

-- Create the database
CREATE DATABASE IF NOT EXISTS library;
USE library;

-- Create tables
CREATE TABLE IF NOT EXISTS books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    publication_year INT
);

CREATE TABLE IF NOT EXISTS loans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    borrower_name VARCHAR(100) NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Insert data
INSERT INTO books (title, author, publication_year) VALUES
('The Little Prince', 'Antoine de Saint-Exupéry', 1943),
('1984', 'George Orwell', 1949),
('Bel-Ami', 'Guy de Maupassant', 1885);

INSERT INTO loans (book_id, borrower_name, loan_date, due_date) VALUES
(1, 'John Doe', '2025-10-15', '2025-11-15'),
(2, 'Mary Smith', '2025-11-01', '2025-12-01'),
(3, 'Peter Brown', '2025-11-10', '2025-12-10');
