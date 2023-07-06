SELECT DISTINCT name
FROM languages
WHERE code IN
    (SELECT code
    FROM countries
    WHERE region = 'Middle East')
ORDER BY name;

-- Subqueries Inside Where Clause

-- Select relevant fields from cities table
SELECT cities.name,country_code,urbanarea_pop
FROM cities
-- Filter using a subquery on the countries table
WHERE name IN 
    (SELECT capital 
    FROM countries)
ORDER BY urbanarea_pop DESC;

SELECT countries.name AS country,
-- Subquery that provides the count of cities   
  (SELECT COUNT(*)
   FROM cities
   WHERE countries.code = cities.country_code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;

-- Select relevant fields
SELECT code,inflation_rate,unemployment_rate
FROM economies
WHERE year = 2015 
  AND code NOT IN
-- Subquery returning country codes filtered on gov_form
	(SELECT code 
  FROM countries
  WHERE gov_form  LIKE '%Republic' OR gov_form  LIKE '%Monarchy%' )
ORDER BY inflation_rate;


