-- Concatenate the first_name and last_name and email 
SELECT first_name || ' ' || last_name || ' <' || email || '>' AS full_email 
FROM customer

-- Concatenate the first_name and last_name and email
SELECT CONCAT(first_name,' ',last_name,' <', email, '>') AS full_email 
FROM customer

SELECT 
  -- Concatenate the category name to coverted to uppercase
  -- to the film title converted to title case
  UPPER(c.name)  || ': ' || INITCAP(f.title) AS film_category, 
  -- Convert the description column to lowercase
  LOWER(f.description) AS description
FROM 
  film AS f 
  INNER JOIN film_category AS fc 
  	ON f.film_id = fc.film_id 
  INNER JOIN category AS c 
  	ON fc.category_id = c.category_id;

    SELECT 
  -- Replace whitespace in the film title with an underscore
  REPLACE(title,' ','_') AS title
FROM film; 

SELECT 
  -- Select the title and description columns
  title,
  description,
  -- Determine the length of the description column
  LENGTH(description) AS desc_len
FROM film;

SELECT 
  -- Select the first 50 characters of description
  LEFT(description,50) AS short_desc
FROM 
  film AS f; 

SELECT 
  -- Select only the street name from the address table
  SUBSTRING(address FROM POSITION(' ' IN address)+1 FOR LENGTH(address))
FROM 
  address;

-- Concatenate the uppercase category name and film title
SELECT 
  CONCAT(UPPER(c.name), ': ',f.title) AS film_category, 
  -- Truncate the description remove trailing whitespace
  TRIM(LEFT(f.description,50)) AS film_desc
FROM 
  film AS f 
  INNER JOIN film_category AS fc 
  	ON f.film_id = fc.film_id 
  INNER JOIN category AS c 
  	ON fc.category_id = c.category_id;