CREATE DATABASE movie_collection;
USE movie_collection;

-- Table for movies
CREATE TABLE movies (
                        movie_id INT AUTO_INCREMENT PRIMARY KEY,
                        title VARCHAR(255) NOT NULL,
                        director VARCHAR(255),
                        release_year YEAR,
                        genre VARCHAR(100),
                        created_by VARCHAR(100), -- User who added the movie
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for users
CREATE TABLE users (
                       user_id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(100) NOT NULL UNIQUE,
                       email VARCHAR(255) NOT NULL UNIQUE,
                       password VARCHAR(255) NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for copies (collections of movies)
CREATE TABLE copies (
                        copy_id INT AUTO_INCREMENT PRIMARY KEY,
                        movie_id INT,
                        user_id INT,
                        status ENUM('Available', 'Checked Out', 'Damaged', 'Reserved') DEFAULT 'Available',
                        quantity INT DEFAULT 1,
                        added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
                        FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Example initial inserts
INSERT INTO movies (title, director, release_year, genre, created_by)
VALUES
    ('Inception', 'Christopher Nolan', 2010, 'Science Fiction', 'admin'),
    ('The Godfather', 'Francis Ford Coppola', 1972, 'Crime', 'admin'),
    ('The Shawshank Redemption', 'Frank Darabont', 1994, 'Drama', 'admin');

INSERT INTO users (username, email, password)
VALUES
    ('user1', 'user1@example.com', 'password1'),
    ('user2', 'user2@example.com', 'password2');

INSERT INTO copies (movie_id, user_id, status, quantity)
VALUES
    (1, 1, 'Available', 3),
    (2, 2, 'Reserved', 1),
    (3, 1, 'Available', 2);