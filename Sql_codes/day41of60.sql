-- Create the correct extension to enable CROSSTAB
CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT * FROM CROSSTAB($$
  SELECT
    Gender, Year, Country --seleting the gender year and country
  FROM Summer_Medals
  WHERE
    Year IN (2008, 2012)
    AND Medal = 'Gold'
    AND Event = 'Pole Vault'
  ORDER By Gender ASC, Year ASC;
-- Filling in the correct column names for the pivoted table
$$) AS ct (Gender VARCHAR,
           "2008" VARCHAR,
           "2012" VARCHAR)

ORDER BY Gender ASC;


--creating the correct extension to enable CROSSTAB
CREATE EXTENSION IF NOT EXISTS tablefunc

SELECT * FROM CROSSTAB($$
    
    WITH Country_Awards AS(
        SELECT
            Country,
            Year,
            COUNT(*) AS Awards
        FROM Summer_Medals
        WHERE 
            Country IN ('FRA','GBR','GER')
            AND Year IN (2004,2008,20012)
            AND Medal = 'Gold'
        GROUP BY Country,Year
    )
    SELECT 
        Country,
        Year,
        RANK() OVER -- ranking the country by highest awards for each year
                (PARTITION BY Year --partition is done for each year
                ORDER BY Awards DESC) :: INTEGER AS ranks
    FROM Country_Awards
    ORDER BY Country ASC , Year ASC; 
    -- creating the column names for the pivoted tables
$$) AS ct (
        Country VARCHAR,
        "2004" INTEGER,
        "2008" INTEGER,
        "2012" INTEGER
)
ORDER BY Country ASC;


