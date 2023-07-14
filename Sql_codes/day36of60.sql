WITH Athlete_Medals AS (
  SELECT
    Athlete,
    COUNT(*) AS Medals
  FROM Summer_Medals
  GROUP BY Athlete)
SELECT
  Athlete,
  Medals,
  -- Rank athletes by the medals they've won
  RANK() OVER (ORDER BY medals DESC) AS Rank_N
FROM Athlete_Medals
ORDER BY Medals DESC;


WITH Athlete_Medals AS (
  SELECT
    Country, Athlete, COUNT(*) AS Medals
  FROM Summer_Medals
  WHERE
    Country IN ('JPN', 'KOR')
    AND Year >= 2000
  GROUP BY Country, Athlete
  HAVING COUNT(*) > 1)
SELECT
  Country,
  -- Rank athletes in each country by the medals they've won
  athlete,
  Medals,
  DENSE_RANK() OVER (PARTITION BY country
                ORDER BY Medals DESC) AS Rank_N
FROM Athlete_Medals
ORDER BY Country ASC, RANK_N ASC;