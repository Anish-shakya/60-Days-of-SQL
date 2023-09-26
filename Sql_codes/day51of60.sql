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