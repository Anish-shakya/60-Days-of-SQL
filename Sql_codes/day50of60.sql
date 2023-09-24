-- List all customer information for customers who rented more than 10 movies.
SELECT *
FROM customers
WHERE customer_id IN
	(select customer_id 
	FROM renting
	Group by customer_id
	having count(*) > 10
	)

-- Select movie IDs and calculate the average rating of movies with rating above average
SELECT movie_id, -- Select movie IDs and calculate the average rating 
       AVG(rating)
FROM renting
GROUP BY movie_id
HAVING AVG(rating) >           -- Of movies with rating above average
	(SELECT AVG(rating)
	FROM renting);

-- The advertising team only wants a list of movie titles.
-- Report the movie titles of all movies with average
-- rating higher than the total average.
SELECT title -- Report the movie titles of all movies with average rating higher than the total average
FROM movies
WHERE movie_id IN
	(SELECT movie_id
	 FROM renting
     GROUP BY movie_id
     HAVING AVG(rating) > 
		(SELECT AVG(rating)
		 FROM renting));    