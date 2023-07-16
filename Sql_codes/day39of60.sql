--Defining a CTE table to store required data
WITH Scadinavian_Medals AS
(
SELECT
    Year,
    COUNT(*) AS Medals
FROM Summer_Medals
WHERE
    Country IN ('DEN','NOR','FIN','SWE','ISL')
    AND Medal = 'Gold'
GROUP BY Year
)
-- Fetching result form CTE
SELECT
    Year,
    Medals,
 -- Maximum medals achieved up to the current year
    MAX(Medals) OVER (ORDER BY Year) AS Max_medals,
-- Max medals for current and next year   
    MAX(Medals) OVER(ORDER BY Year ASC
            ROWS BETWEEN CURRENT ROW
            AND 1 FOLLOWING) AS MAX_medals_next
ORDER BY Year
FROM Scadinavian_Medals


--Defining a CTE table to store required data
WITH Scadinavian_Medals AS
(
SELECT
    Year,
    COUNT(*) AS Medals
FROM Summer_Medals
WHERE
    Country IN ('DEN','NOR','FIN','SWE','ISL')
    AND Medal = 'Gold'
GROUP BY Year
)
-- Fetching result form CTE
SELECT
    Year,
    Medals,
 -- Maximum medals achieved up to the current year
    MAX(Medals) OVER (ORDER BY Year) AS Max_medals,
-- Max medals for current and next year   
    MAX(Medals) OVER(ORDER BY Year ASC
            ROWS BETWEEN CURRENT ROW
            AND 1 FOLLOWING) AS MAX_medals_next
ORDER BY Year
FROM Scadinavian_Medals