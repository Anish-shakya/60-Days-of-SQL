-- Select all fields from economies2015
SELECT * From economies2015 
-- Set operation
UNION
-- Select all fields from economies2019
SELECT * FROM economies2019
ORDER BY code, year;

--Amend the query to return all combinations (including duplicates) of country
-- code and year in the economies or the populations tables.
SELECT code, year
FROM economies
-- Set theory clause
UNION ALL
SELECT country_code, year
FROM populations
ORDER BY code, year;

-- Return all cities with the same name as a country
SELECT name
FROM cities
INTERSECT
SELECT name 
FROM countries

-- Return all cities that do not have the same name as a country
SELECT name
FROM cities
EXCEPT
SELECT name
FROM countries
ORDER BY name;