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
(1, 2), (2, 2
