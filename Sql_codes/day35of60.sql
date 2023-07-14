WITH Discus_Medalists AS (
  SELECT DISTINCT
    Year,
    Athlete
  FROM Summer_Medals
  WHERE Medal = 'Gold'
    AND Event = 'Discus Throw'
    AND Gender = 'Women'
    AND Year >= 2000)
SELECT
  -- For each year, fetch the current and future medalists
  year,
  Athlete,
  LEAD(Athlete,3) OVER (ORDER BY year ASC) AS Future_Champion
FROM Discus_Medalists
ORDER BY Year ASC;



WITH All_Male_Medalists AS (
  SELECT DISTINCT
    Athlete
  FROM Summer_Medals
  WHERE Medal = 'Gold'
    AND Gender = 'Men')
SELECT
  -- Fetch all athletes and the first athlete alphabetically
  athlete,
  FIRST_VALUE(athlete) OVER (
    ORDER BY athlete ASC
  ) AS First_Athlete
FROM All_Male_Medalists;



WITH Hosts AS (
  SELECT DISTINCT Year, City
    FROM Summer_Medals)
SELECT
  Year,
  City,
  -- Get the last city in which the Olympic games were held
  LAST_VALUE(city) OVER (
   ORDER BY Year ASC
   RANGE BETWEEN
     UNBOUNDED PRECEDING AND
     UNBOUNDED FOLLOWING
  ) AS Last_City
FROM Hosts
ORDER BY Year ASC;