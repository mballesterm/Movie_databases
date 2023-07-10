table movies;
table links;
table ratings;
table tags;

CREATE TABLE movies_ov AS (
SELECT movies.moviesId as movieNr
	   movies.title as movie_titl
	   movie.genre as movie_gender
	   movie.year AS movie_year,
	   rantings.userid as rating_id
	   raitings.rating AS ratin_ratings
FROM movies 
JOIN rating
USING (movieId);

-- Using a JOIN display 5 movie titles with the lowest imdb ids

create table 
SELECT movies.title as Title,
	   links.imdbid as Imdbid
FROM movies
JOIN links ON movies.movieId = links.movieId
ORDER BY links.movieId ASC
LIMIT 5;

-- Display the count of drama movies

DROP TABLE IF EXISTS genres;
CREATE TABLE genres AS (
    SELECT 
    	movieid,
    	regexp_split_to_table(genres, '\|') AS genre
    FROM movies
);

select count (*) genre from genres
where genre ='Drama'
4359

-- Using a JOIN display all of the movie titles that have the tag fun

SELECT movies.title as Title,
	  tags.tag as Tag
FROM movies 
JOIN tags ON movies.movieId = tags.movieId
WHERE tags.tag = 'fun';

--Using a JOIN find out which movie title is the first without a tag 

SELECT movies.title as Title,
	   tags.tag as non_tag
FROM movies
LEFT JOIN tags ON movies.movieId = tags.movieId
WHERE tags.movieId IS NULL
ORDER BY movies.movieId
LIMIT 1;

-- Using a JOIN display the top 3 genres and their average rating

SELECT genre.genre, AVG(r.rating) AS average_rating
FROM genres g
JOIN ratings r ON g.movie_id = r.movie_id
GROUP BY g.genre
ORDER BY average_rating DESC
LIMIT 3;

--Using a JOIN display the top 10 movie titles by the number of ratings
SELECT movies.title, COUNT(*) AS rating_count
FROM movies
JOIN ratings ON movies.movieId = ratings.movieId
GROUP BY movies.title
ORDER BY rating_count DESC
LIMIT 10;

--Using a JOIN display all of the Star Wars movies in order of average rating where the 
--film was rated by at least 40 users

SELECT movies.title, AVG(ratings.rating) AS average_rating
FROM movies
JOIN ratings ON movies.movieId = ratings.movieId
WHERE movies.title LIKE '%Star Wars%'
GROUP BY movies.title
HAVING COUNT(ratings.rating) >= 40
ORDER BY average_rating DESC;

--  Create a derived table from one or more of the above queries

CREATE VIEW derived_table AS
SELECT movies.title, AVG(r.rating) AS average_rating
FROM movies
JOIN ratings ON movies.movieId = ratings.movieId
WHERE movies.title LIKE '%Star Wars%'
GROUP BY movies.title
HAVING COUNT(ratings.rating) >= 40
ORDER BY average_rating DESC;
-------------------------------
-- BONUS--
Top 5 with best rating and which Gender are they on??

create table Top_Rating1 as(
select movies.title as movie_title,
	   movies.genres as movie_genres,
	   ratings.rating as rating_num,
	   movies.year as Year
from movies 
join ratings 
on movies.movieId = ratings.movieId);
          
select * from Top_Rating1;

select movie_title, avg(rating_num) as average_rating
from Top_Rating 
group by Top_Rating.movie_title
order by average_rating desc 
limit 5;
