# Movie Database Project  

This repository contains a comprehensive movie database project. The database is designed to meet specific requirements, showcasing advanced database management concepts and normalization practices.

## **Description**  
The project is a relational database that stores information about movies, genres, directors, actors, and their relationships. It demonstrates various database functionalities such as views, triggers, stored procedures, and events. The database was developed and managed using **phpMyAdmin**. The schema is normalized to at least Boyce-Codd Normal Form (BCNF).  
- **Tables:**  
  - Movies  
  - Genres  
  - Directors  
  - Actors  
  - MovieDirectors  
  - MovieActors  
- **Primary Keys:** Includes auto-incremented, natural, and composite primary keys.  
- **Views:**  
  - `vMoviesDirectors`: A two-table foreign key relationship between movies and directors.  
  - `vMoviesDirectorsGenres`: A three-table foreign key relationship involving movies, directors, and genres.  
- **Triggers:**  
  - `CheckMovieRating`: Ensures movie ratings are between 0.0 and 10.0.  
- **Stored Procedures:**  
  - `MarkClassic`: Marks movies older than 25 years as classics.  
- **Functions:**  
  - `GetTotalMovies`: Returns the total number of movies in the database.  
- **Events:**  
  - `DeleteOldMovies`: Deletes movies older than 50 years.  
- **Indexes:**  
  - Unique and non-unique indexes on non-primary key fields.  

## **Schema Highlights**  
- **Data Types Used:**  
  - INT, CHAR, VARCHAR, DATE, DATETIME, LONGTEXT, DECIMAL.  
- **Constraints:**  
  - `ON DELETE CASCADE` and `ON DELETE RESTRICT` for foreign keys.  
- **Default Values:**  
  - `CreatedAt` uses the current date/time as a default value.  
  - `Country` defaults to `'Unknown'`.

## **Sample Data**  
The database includes 15 movies and 5 rows for each additional table, ensuring no table has fewer than 3 rows.

Thank you for reading :)
