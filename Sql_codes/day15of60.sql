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



-- Select fields from cities
SELECT 
	name, -- Name of the city
    country_code, -- Country code of the city
    city_proper_pop, -- Population of the city proper
    metroarea_pop, -- Population of the metropolitan area
    city_proper_pop / metroarea_pop * 100 AS city_perc -- Calculate the percentage of city's population compared to metropolitan area population
FROM cities
-- Use subquery to filter city name
WHERE name IN
  (SELECT capital -- Select capital cities
   FROM countries
   WHERE (continent = 'Europe' -- Filter by continent is 'Europe'
   OR continent LIKE '%America')) -- or continent contains the word 'America'
-- Add filter condition such that metroarea_pop does not have null values
	  AND metroarea_pop IS NOT NULL
-- Sort and limit the result
ORDER BY city_perc DESC -- Sort the result in descending order based on city_perc
LIMIT 10; -- Limit the result to the top 10 records
