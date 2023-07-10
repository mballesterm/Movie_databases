drop table if exitst movies CASCADE;
create table movies(
    movie_id int primary key not null,
    title varchar(255) not null,
    genres varchar(255),
    year int
 );
\ copy movies from 'movies.csv' delimiter ',' csv header;


drop table if exists links 
create table links(
    movie_id int primary key not null,
    imdbld int,
    tmdbld int
 );
\ copy links from 'links.csv' delimiter ',' csv header;


drop table if exists ratings CASCADE;
create table ratings (
    user_id int primary key not null,
    movies_id int not null,
    rating numeric not null,
    timestamp int
 );
\ copy ratings from 'ratings.csv' delimiter ',' csv header;


drop table if exists tags;
create table tags(
    user_id int primary key not null,
    movie_id int not null,
    tag varchar(255),
    timestamp int
 );
\ copy tags from 'tags.csv' delimiter ',' csv header;


CREATE TABLE links (
    movieid INT REFERENCES movies(movieid),
    imdbid INT,
    tmdbid INT
);
