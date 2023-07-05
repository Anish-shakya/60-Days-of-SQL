-- Find the release_year and film_count of each year

SELECT release_year, COUNT(*) AS film_count
FROM films
GROUP BY release_year

-- Find the release_year and average duration of films for each year
SELECT release_year,AVG(duration) AS avg_duration
FROM films
GROUP BY release_year

-- Find the release_year, country, and max_budget, then group and order by release_year and country
SELECT release_year,country,max(budget) AS max_budget
FROM films 
GROUP BY release_year,country
ORDER BY release_year,country

--Which release_year had the most language diversity?
SELECT release_year,COUNT(DISTINCT language) AS language_count
FROM films
Group BY release_year
ORDER BY language_count desc


