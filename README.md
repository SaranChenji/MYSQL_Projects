# MoviesDB - Database Management System

## Overview
MoviesDB is a database system designed to manage movie-related information efficiently. This database helps track movie details, genres, directors, actors, reviews, and various relationships between them. It supports functionalities such as adding movies, updating ratings, retrieving information using queries, and performing analysis with aggregate functions.

## Database Setup
A structured relational database is created to store movie-related data. It includes tables for movies, genres, directors, actors, and reviews, ensuring efficient data management and retrieval.

## Features
### 1. Movie Management
The system allows users to add, update, and retrieve movie details. Each movie is linked to a specific genre and director for better categorization.

### 2. Actor Management
Actors involved in movies are maintained in a separate table, enabling easy association of multiple actors with different movies.

### 3. Director Management
Directors and their details are stored separately, allowing efficient tracking of their contributions to various films.

### 4. Review Management
User reviews and ratings for movies are stored, helping in evaluating movie performance. The system dynamically calculates the average rating based on reviews.

### 5. Advanced Queries
Various SQL queries enable users to fetch specific information, such as:
- Listing movies along with their directors and release years.
- Displaying actors associated with each movie.
- Finding high-rated movies based on user reviews.
- Aggregating data to count reviews per movie and calculate average ratings by genre.

### 6. Stored Procedures
Stored procedures automate complex tasks, such as fetching the number of movies per genre, to streamline data retrieval and management.

### 7. Triggers
A trigger automatically updates the movie rating whenever a new review is added. This ensures data consistency and accuracy without manual intervention.

## Sample Queries
Some of the key queries used in the system include:
- Fetching all movies and their respective directors.
- Listing movies with their actors.
- Identifying movies with ratings above the average.

## View Creation
A database view is created to display highly rated movies, making it easier to retrieve specific data without running complex queries repeatedly.

## Stored Procedure Execution
Stored procedures are used for automating repetitive tasks, such as counting movies by genre, to improve efficiency.

## Checking Available Procedures and Triggers
Users can retrieve a list of stored procedures and triggers to understand the automated processes running within the database.

## Conclusion
MoviesDB provides a well-structured approach to managing movie-related data. It enables easy data retrieval, modification, and analysis through SQL queries, views, stored procedures, and triggers. The project demonstrates effective database normalization and relational data management for a movie-based application.

