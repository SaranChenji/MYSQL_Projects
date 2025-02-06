-- Create Database
CREATE DATABASE MoviesDB;  
USE MoviesDB;

-- Create Tables
CREATE TABLE Genres (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(100) NOT NULL
);
			
CREATE TABLE Directors (
    director_id INT PRIMARY KEY AUTO_INCREMENT,
    director_name VARCHAR(255) NOT NULL,
    birth_year INT
);

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL,
    genre_id INT,
    director_id INT,
    rating DECIMAL(3,1),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id),
    FOREIGN KEY (director_id) REFERENCES Directors(director_id)
);

CREATE TABLE Actors (
    actor_id INT PRIMARY KEY AUTO_INCREMENT,
    actor_name VARCHAR(255) NOT NULL,
    birth_year INT
);

CREATE TABLE Movie_Actors (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    reviewer_name VARCHAR(255),
    review_text TEXT,
    rating DECIMAL(3,1),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

-- Show Tables
SHOW TABLES;

-- Describe Tables
DESC Genres;
DESC Directors;
DESC Movies;
DESC Actors;
DESC Movie_Actors;
DESC Reviews;

-- Insert Data
INSERT INTO Genres (genre_name) VALUES
('Action'), ('Drama'), ('Comedy'), ('Thriller'), ('Horror');

INSERT INTO Directors (director_name, birth_year) VALUES
('Mani Ratnam', 1956),
('Shankar', 1963),
('Vetrimaaran', 1975),
('Lokesh Kanagaraj', 1986);

INSERT INTO Movies (title, release_year, genre_id, director_id, rating) VALUES
('Ponniyin Selvan', 2022, 1, 1, 8.1),
('Anniyan', 2005, 2, 2, 8.5),
('Asuran', 2019, 3, 3, 8.8),
('Vikram', 2022, 4, 4, 9.0);

INSERT INTO Actors (actor_name, birth_year) VALUES
('Kamal Haasan', 1954),
('Vikram', 1966),
('Dhanush', 1983),
('Suriya', 1975);

INSERT INTO Movie_Actors (movie_id, actor_id) VALUES
(1, 2), (2, 2), (3, 3), (4, 1);

INSERT INTO Reviews (movie_id, reviewer_name, review_text, rating) VALUES
(1, 'Rahul', 'Epic movie with great visuals!', 8.5),
(2, 'Priya', 'Unique concept and amazing execution.', 9.0),
(3, 'Arun', 'A powerful film with a strong message.', 9.2),
(4, 'Deepa', 'Best action movie in recent times.', 9.5);

-- Select Values From Tables
SELECT * FROM Genres;
SELECT * FROM Directors;
SELECT * FROM Movies;
SELECT * FROM Actors;
SELECT * FROM Movie_Actors;
SELECT * FROM Reviews;

-- Update Queries
UPDATE Movies SET rating = 8.3 WHERE title = 'Ponniyin Selvan';
UPDATE Directors SET birth_year = 1958 WHERE director_name = 'Mani Ratnam';


-- Select Updated Details
SELECT rating FROM Movies;
SELECT birth_year FROM Directors;

-- Joins
SELECT m.title, d.director_name, m.release_year 
FROM Movies m 
JOIN Directors d ON m.director_id = d.director_id;

SELECT m.title, a.actor_name 
FROM Movies m
JOIN Movie_Actors ma ON m.movie_id = ma.movie_id 
JOIN Actors a ON ma.actor_id = a.actor_id;

SELECT r.review_id, m.title AS movie_title, r.reviewer_name, r.review_text, r.rating
FROM Reviews r
JOIN Movies m ON r.movie_id = m.movie_id;

-- Aggregate Functions
SELECT m.title, COUNT(r.review_id) AS total_reviews 
FROM Movies m
LEFT JOIN Reviews r ON m.movie_id = r.movie_id
GROUP BY m.title;

SELECT g.genre_name, AVG(m.rating) AS avg_rating
FROM Movies m
JOIN Genres g ON m.genre_id = g.genre_id
GROUP BY g.genre_name;

SELECT MIN(release_year) AS Oldest_Movie, MAX(release_year) AS Newest_Movie
FROM Movies;

-- View
CREATE VIEW HighRatedMovies AS
SELECT title, rating 
FROM Movies 
WHERE rating >= 8.0;

SELECT * FROM HighRatedMovies;

-- Show View Structure
SHOW CREATE VIEW HighRatedMovies;

-- Subquery
SELECT title, rating 
FROM Movies 
WHERE rating > (SELECT AVG(rating) FROM Movies);

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetMovieCountByGenre()
BEGIN
    SELECT g.genre_name, COUNT(m.movie_id) AS movie_count 
    FROM Movies m
    JOIN Genres g ON m.genre_id = g.genre_id
    GROUP BY g.genre_name;
END //
DELIMITER ;

CALL GetMovieCountByGenre();

-- Show Stored Procedures
SHOW PROCEDURE STATUS WHERE Db = 'MoviesDB';

-- Trigger: Auto-update Movie Rating after inserting a Review
DELIMITER //
CREATE TRIGGER UpdateMovieRating
AFTER INSERT ON Reviews
FOR EACH ROW
BEGIN
    UPDATE Movies
    SET rating = (SELECT AVG(r.rating) FROM Reviews r WHERE r.movie_id = NEW.movie_id)
    WHERE movie_id = NEW.movie_id;
END;
//
DELIMITER ;

SHOW TRIGGERS;

--END
