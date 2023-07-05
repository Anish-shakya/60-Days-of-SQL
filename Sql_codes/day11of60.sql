-- Count the unique titles
SELECT COUNT(DISTINCT title) AS nineties_english_films_for_teens
FROM films
-- Filter to release_years to between 1990 and 1999
WHERE release_year BETWEEN 1990 AND 1999
-- Filter to English-language films
AND language = 'English'	
-- Narrow it down to G, PG, and PG-13 certifications
AND certification IN ('G','PG','PG-13');

-- Find the title, certification, and language all films certified NC-17 or R that are in English, Italian, or Greek
SELECT title,certification,language
FROM films
WHERE certification IN ('NC-17','R')
AND language IN('English','Italian','Greek')

---using lIKE operator
SELECT name
FROM people
-- Select names that don't start with A
WHERE name NOT LIKE 'A%'