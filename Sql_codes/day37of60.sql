WITH Events AS (
  SELECT DISTINCT Event
  FROM Summer_Medals)
SELECT
  --- Split up the distinct events into 111 unique groups
  Event,
  NTILE(111) OVER (ORDER BY Events ASC) AS Page
FROM Events
ORDER BY Event ASC;



WITH Athlete_Medals AS (
  SELECT Athlete, COUNT(*) AS Medals
  FROM Summer_Medals
  GROUP BY Athlete
  HAVING COUNT(*) > 1)
SELECT
  Athlete,
  Medals,
  -- Split athletes into thirds by their earned medals
  NTILE(3) OVER (ORDER BY Medals DESC) AS Third
FROM Athlete_Medals
ORDER BY Medals DESC, Athlete ASC;



WITH Athlete_Medals AS (
  SELECT Athlete, COUNT(*) AS Medals
  FROM Summer_Medals
  GROUP BY Athlete
  HAVING COUNT(*) > 1),
  
  Thirds AS (
  SELECT
    Athlete,
    Medals,
    NTILE(3) OVER (ORDER BY Medals DESC) AS Third
  FROM Athlete_Medals)
SELECT
  -- Get the average medals earned in each third
  Third,
  AVG(medals) AS Avg_Medals
FROM Thirds
GROUP BY Third
ORDER BY Third ASC;