-- smolBSD 'nbmp' service sql file example.

-- Create the database
CREATE DATABASE IF NOT EXISTS task_management;
USE task_management;

-- Create tables
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    due_date DATE,
    status ENUM('to do', 'in progress', 'done') DEFAULT 'to do',
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert data
INSERT INTO users (name, email) VALUES
('Alice Smith', 'alice.smith@example.com'),
('Bob Johnson', 'bob.johnson@example.com');

INSERT INTO tasks (user_id, title, description, due_date, status) VALUES
(1, 'Prepare meeting', 'Prepare slides for tomorrow''s meeting', '2025-12-15', 'in progress'),
(1, 'Send report', 'Send the monthly report to the client', '2025-12-20', 'to do'),
(2, 'Fix bugs', 'Fix reported bugs in the payment module', '2025-12-10', 'done');

