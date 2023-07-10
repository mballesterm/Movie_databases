--1. How many ratings are available in the dataset?
--Display the total row count of the ratings table.

select count(rating) from ratings; 

--100818 

--2 What is the distribution of genres combinations?
--Display the total count of different genres combinations in the movies table.

select count (distinct genres) from movies;

--951 genres

--3 Have you already explored the tags table? 
--What unique tags can you see for a selected movie?
--Display unique tags for movie with id equal 60756. Use tags table.

select distinct (tag) from tags 
where movie_id = 60756;

--comedy, funny, highly quotable, will ferrell

--4 How many movies from different years do we have in the dataset? 
-- Focus only on given time period.Display the count of movies in the
-- years 1990-2000 using the movies table. Display year and movie_count.

select year, count(title) from movies 
where year between 1990 and 2000
group by year 
order by year;

--5 Which year had the highest number of movies in the dataset?
--Display the year where most of the movies u=in the database are from.

select year, count(title) from movies 
group by year 
order by count DESC
limit 2;
--year 2002, 311 movies

--6 One of the metrics that could be used to measure the popularity of the movies
-- is the total count of ratings (the number of people who rated a movie).
-- What are the most popular movies if we use this metric?Display 10 movies with the 
-- most ratings. Use ratings table. Display movieid, count_movie_ratings.

select movie_id, count(rating) as count_movie_ratings
from ratings 
group by movie_id 
order by count_movie_ratings DESC
limit 10;

--7 Another metric that we could use to measure the popularity of the movies
-- is the average rating. However, to ensure the quality of this information
-- we need to have at least a given number of ratings. 
--What are the most popular movies using this metric?Display the top 10 highest
-- rated movies by average that have at least 50 ratings.Display the movieid,
-- average rating and rating count. Use the ratings table.

select movie_id, avg(rating), count(rating)
from ratings 
group by movie_id
having count(rating) > 50
order by avg desc;

-- 4.42  is the rating from movie 318

--8 Imagine that you would like to continue focusing on the drama movies only. 
--As you have multiple questions about drama movies you decided to create 
--a view representing drama movies that you could reuse later on.
--Create a view that is a table of only movies that contain drama as one 
--of it’s genres. Display the first 10 movies in the view.

create view drama as
select * 
from movies
where genres ilike '%Drama%';

select * from drama
limit 10;
