SELECT f.title, f.rental_duration,
    -- Calculate the number of days rented
     r.return_date - r.rental_date AS days_rented
FROM film AS f
     INNER JOIN inventory AS i ON f.film_id = i.film_id
     INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
ORDER BY f.title;

--using Age function
SELECT f.title, f.rental_duration,
    -- Calculate the number of days rented
	AGE(return_date, rental_date) AS days_rented
FROM film AS f
	INNER JOIN inventory AS i ON f.film_id = i.film_id
	INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
ORDER BY f.title;


---Using EXTRACT() function
SELECT 
  EXTRACT(YEAR FROM rental_date) AS year,
  EXTRACT(MONTH FROM rental_date) AS MONTH,
  EXTRACT(DAY FROM rental_date) AS DAY
FROM rental

SELECT 
  -- Extract day of week from rental_date
  EXTRACT(dow FROM rental_date) AS dayofweek 
FROM rental 
LIMIT 100;

-- Extract day of week from rental_date
SELECT 
  EXTRACT(dow FROM rental_date) AS dayofweek, 
  -- Count the number of rentals
  COUNT(*) as rentals 
FROM rental 
GROUP BY 1;


---Using DATE_TRUNC

-- Truncate rental_date by year
SELECT DATE_TRUNC('YEAR',rental_date) AS rental_year
FROM rental;

-- Truncate rental_date by month
SELECT DATE_TRUNC('MONTH', rental_date) AS rental_month
FROM rental;

-- Truncate rental_date by day of the month 
SELECT DATE_TRUNC('DAY',rental_date) AS rental_day 
FROM rental;