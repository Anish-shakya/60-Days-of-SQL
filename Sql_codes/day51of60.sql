SELECT country,genre,COUNT(*)
FROM renting_extented
GROUP BY CUBE(country,genre);

-- List the number of movies for different genres and the year of release on all aggregation levels by 
-- using the CUBE operator.
SELECT genre,
       year_of_release,
       COUNT(*)
FROM movies
GROUP BY CUBE (genre,year_of_release)
ORDER BY year_of_release;

-- Calculate the average rating for all aggregation levels of country and genre.
SELECT 
	c.country, 
	m.genre, 
	AVG(r.rating) AS avg_rating -- Calculate the average rating 
FROM renting AS r
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
GROUP BY CUBE(c.country,m.genre); 


--- ROLLUP 
SELECT country,genre,COUNT(*)
FROM renting_extented
GROUP BY ROLLUP (country,genre)


--calculate the average ratings and the number of ratings 
--for each country and genre, as well as 
--an aggregation over all genres for each country 
--and the overall average and total number.
SELECT 
	c.country, 
	m.genre, 
	AVG(r.rating) AS avg_rating, 
	COUNT(*) AS num_rating
FROM renting AS r
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
GROUP BY ROLLUP(c.country,m.genre)
ORDER BY c.country, m.genre;


SELECT genre,
	   AVG(rating) AS avg_rating,
	   COUNT(rating) AS n_rating,
       COUNT(*) AS n_rentals,     
	   COUNT(DISTINCT m.movie_id) AS n_movies 
FROM renting AS r
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
WHERE r.movie_id IN ( 
	SELECT movie_id
	FROM renting
	GROUP BY movie_id
	HAVING COUNT(rating) >= 3 )
AND r.date_renting >= '2018-01-01'
GROUP BY genre
ORDER BY avg_rating DESC; 


SELECT a.nationality,
       a.gender,
	   AVG(r.rating) AS avg_rating,
	   COUNT(r.rating) AS n_rating,
	   COUNT(*) AS n_rentals,
	   COUNT(DISTINCT a.actor_id) AS n_actors
FROM renting AS r
LEFT JOIN actsin AS ai
ON ai.movie_id = r.movie_id
LEFT JOIN actors AS a
ON ai.actor_id = a.actor_id
WHERE r.movie_id IN ( 
	SELECT movie_id
	FROM renting
	GROUP BY movie_id
	HAVING COUNT(rating) >= 4)
AND r.date_renting >= '2018-04-01'
GROUP BY CUBE(a.nationality,a.gender); 