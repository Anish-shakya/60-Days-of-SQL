-- Query the sum of film durations
SELECT SUM(duration) AS total_duration
FROM films

-- Calculate the average duration of all films
SELECT AVG(duration) AS average_duration
FROM films

-- Find the latest release_year
SELECT MAX(release_year) AS latest_year
FROM films

-- Find the duration of the shortest film
SELECT MIN(duration) AS shortest_film
FROM films

-- Calculate the sum of gross from the year 2000 or later
SELECT SUM(gross) AS total_gross
FROM films
WHERE year > = 2000

-- Calculate the average gross of films that start with A
SELECT AVG(gross) AS avg_gross_A
FROM films
WHERE title LIKE 'A%'

-- Calculate the highest gross film released between 2000-2012
SELECT MAX(gross) AS highest_gross 
FROM films
WHERE release_year BETWEEN 2000 AND 2012;