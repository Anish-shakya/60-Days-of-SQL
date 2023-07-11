SELECT 
	c.name AS country,
    -- Count games from the 2012/2013 season
	COUNT(CASE WHEN m.season = '2012/2013' 
        	THEN m.id ELSE NULL END) AS matches_2012_2013
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
-- Group by country name alias
GROUP BY country;

SELECT c.name AS country,
 -- Count matches in each of the 3 seasons
COUNT(CASE WHEN m.season = '2012/2013' THEN m.id ELSE NULL END ) AS matches_2012_2013,
COUNT(CASE WHEN m.season = '2013/2014' THEN m.id ELSE NULL END) AS matches_2013_2014,
COUNT(CASE WHEN m.season = '2014/2015' THEN m.id ELSE NULL END) AS matches_2014_2015
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
GROUP BY country


SELECT c.name AS country,
   -- Count the home wins, away wins, and ties in each country
COUNT(CASE WHEN m.home_goal > m.away_goal THEN m.id END ) AS home_wins,
COUNT(CASE WHEN m.home_goal < m.away_goal THEN m.id END) AS away_wins,
COUNT(CASE WHEN m.home_goal =  m.away_goal THEN m.id END) AS ties
FROM country c
LEFT JOIN matches m
ON c.id = m.country_id
GROUP BY country


SELECT 
	c.name AS country,
    -- Calculate the percentage of tied games in each season
	AVG(CASE WHEN m.season='2013/2014' AND m.home_goal = m.away_goal THEN 1
			WHEN m.season='2013/2014' AND m.home_goal != m.away_goal THEN 0
			END) AS ties_2013_2014,
	AVG(CASE WHEN m.season='2014/2015' AND m.home_goal = m.away_goal THEN 1
			WHEN m.season = '2014/2015' AND m.home_goal != m.away_goal THEN 0
	END ) AS ties_2014_2015
FROM country AS c
LEFT JOIN matches AS m
ON c.id = m.country_id
GROUP BY country;
















