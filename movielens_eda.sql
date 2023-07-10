drop table if exists movies;
create table movies(
    movieId int primary key not null,
    title varchar(255) not null,
    genres varchar(255),
    year int
 );



drop table if exists links ;
create table links(
    movieId int,
    imdbId int,
    tmdbId int
 );



drop table if exists ratings;
create table ratings (
    userId int  not null,
    movieId int ,
    rating numeric,
    timestamp int
 );



drop table if exists tags;
create table tags(
    userId int ,
    movieId int,
    tag varchar(255),
    timestamp int
 );

-- What is the data structure? What information do we have available for movies?

table movies

Here we can see the movie Id, the titleof the movie the gender and the year
it was realesed.

-- In the movies table there is a field called movieId. Sometimes we will not 
-- need this field for the analysis.

removing column  movied Id:

SELECT title, genres 
FROM  movies
WHERE title  LIKE 'A%'
ORDER BY title ASC
LIMIT 10;

-- Number of rows

select count (title) from movies;

-- display first 10 pure Drama Movies Only & how many pure dram movie there are

select title, genres from movies where genres like 'Drama';

select count (title) from  movies where genres like 'Drama';

1052

-- Display the count of drama movies that can also contain other genres.

select count (title) from  movies where genres like '%Drama%';

1359

 The numbers is different than the previus one because there is movies, tha 
 are pure Dram an movies that are Dra plus other genres

-- Display the count of movies don’t have drama (in any combination) as assigned genre

select count (title) from  movies where genres not like '%Drama%';

5370

-- What is the year distribution of the movies? Do you have a favorite film? Which year
-- is it from? How many movies from this year are visible in the movies dataset?

select year, title from movies where title LIKE 'Life ';

select count (year) from  movies where year = 1999;

263 movies in year 1999


select year, title from movies where title LIKE '%Lord of the Rings% ';

2001, 2002, 2003 
select count (year) from  movies where year = 2001;
294

select count (year) from  movies where year = 2002;
311

select count (year) from  movies where year = 2003;
279

-- Display the count of movies that were released in 2003.

select count (year) from  movies where year = 2003;
 279

comparing movies 1910 to 2010

select count (year) from  movies where year = 2010;
247

select count (year) from  movies where year = 1910;
0

-- Find all movies with a year lower 1910.

select count (title) from movies where year > 1910;
9726

-- Retrieve all Star Wars movies from the movie table.

select  title, year from movies where title LIKE '%Star Wars% ';

in total are 13 Star Wars movies. Starting in 77, 80, 83, 99, 2002,
2005, 2008, 2015, 2016, 2017, 2018 & a Holiday Special in 1978



 select title, genres from  movies where year = 1990;


-- 

--How many ratings are available in the dataset?

--Display the total row count of the ratings table.

SELECT COUNT(*) AS rating_count
FROM ratings;



