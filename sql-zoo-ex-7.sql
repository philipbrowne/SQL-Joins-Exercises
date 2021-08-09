-- #1
SELECT id, title
FROM movie
WHERE yr=1962;

--#2
SELECT yr 
FROM movie 
WHERE title = 'Citizen Kane';

--#3
SELECT id, title, yr 
FROM movie 
WHERE title 
LIKE '%Star Trek%' 
ORDER BY yr;

--#4
SELECT id 
FROM actor 
WHERE name = 'Glenn Close';

--#5
SELECT id 
FROM movie 
WHERE title='Casablanca';

--#6
SELECT name 
FROM movie 
JOIN casting 
ON movie.id = casting.movieid 
JOIN actor 
ON casting.actorid = actor.id 
WHERE title='Casablanca';

--#7
SELECT name 
FROM movie 
JOIN casting 
ON movie.id = casting.movieid 
JOIN actor 
ON casting.actorid = actor.id 
WHERE title='Alien';

--#8
SELECT title
FROM movie 
JOIN casting 
ON movie.id = casting.movieid 
JOIN actor 
ON casting.actorid = actor.id 
WHERE actor.name='Harrison Ford';

--#9
SELECT title
FROM movie 
JOIN casting 
ON movie.id = casting.movieid 
JOIN actor 
ON casting.actorid = actor.id 
WHERE actor.name='Harrison Ford' 
AND casting.ord != 1;

--#10
SELECT title, actor.name
FROM movie 
JOIN casting 
ON movie.id = casting.movieid 
JOIN actor 
ON casting.actorid = actor.id 
WHERE movie.yr = 1962 
AND casting.ord = 1;

--#11
SELECT movie.yr, COUNT(title) FROM movie 
JOIN casting 
ON movie.id = casting.movieid 
JOIN actor 
ON casting.actorid = actor.id
WHERE actor.name = 'Rock Hudson'
GROUP BY movie.yr HAVING count(title) > 1 
ORDER BY count(title) DESC
LIMIT 2;


--#12
SELECT movie.title, actor.name
FROM movie 
JOIN casting 
ON movie.id = casting.movieid 
JOIN actor 
ON casting.actorid = actor.id
WHERE casting.ord = 1
AND movieid in 
(SELECT movieid FROM casting 
JOIN actor
ON actorid = actor.id 
WHERE name='Julie Andrews');

--#13 
SELECT actor.name
FROM movie 
JOIN casting 
ON movie.id = casting.movieid 
JOIN actor 
ON casting.actorid = actor.id
WHERE ord=1 GROUP BY actor.name
HAVING COUNT(actorid) >= 15 ORDER BY actor.name;

--#14
SELECT movie.title, COUNT(actorid)
FROM movie 
JOIN casting 
ON movie.id = casting.movieid 
JOIN actor 
ON casting.actorid = actor.id
WHERE movie.yr = 1978
GROUP BY movie.title 
ORDER BY COUNT(actorid) DESC, movie.title;

--#15
SELECT distinct actor.name
FROM movie
JOIN casting
ON casting.movieid = movie.id
JOIN actor
ON actor.id = casting.actorid
where movie.id in (select movieid from casting join actor on id =actorid where 
actor.name = 'Art Garfunkel') and actor.name <> 'Art Garfunkel'
