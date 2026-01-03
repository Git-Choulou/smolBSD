-- smolBSD 'nbmp' service sql file example.

-- Create the database
CREATE DATABASE IF NOT EXISTS cooking_recipes;
USE cooking_recipes;

-- Create tables
CREATE TABLE IF NOT EXISTS recipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    prep_time INT COMMENT 'in minutes',
    difficulty_level ENUM('easy', 'medium', 'hard') DEFAULT 'medium'
);

CREATE TABLE IF NOT EXISTS ingredients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT NOT NULL,
    ingredient_name VARCHAR(100) NOT NULL,
    quantity VARCHAR(50),
    FOREIGN KEY (recipe_id) REFERENCES recipes(id)
);

-- Insert data
INSERT INTO recipes (name, prep_time, difficulty_level) VALUES
('Carbonara pasta', 20, 'easy'),
('Apple pie', 60, 'medium'),
('Chocolate soufflé', 45, 'hard');

INSERT INTO ingredients (recipe_id, ingredient_name, quantity) VALUES
(1, 'Pasta', '400g'),
(1, 'Bacon', '150g'),
(1, 'Cream', '20cl'),
(2, 'Pie crust', '1 roll'),
(2, 'Apples', '6'),
(2, 'Sugar', '100g'),
(3, 'Dark chocolate', '200g'),
(3, 'Eggs', '4'),
(3, 'Butter', '50g');
