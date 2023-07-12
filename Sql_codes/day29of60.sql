SELECT 
	-- Selecting the id, country name, season, home, and away goals
	m.id,
	c.name as country,
	m.season,
	m.home_goal,
	m.away_goal,
    --  window function OVER() to include the aggregate average in each row
	AVG(m.home_goal+m.away_goal) OVER() AS overall_avg
FROM match AS m
LEFT JOIN country AS c ON m.country_id = c.id;

SELECT 
	-- Selecting the league name and average goals scored
	 l.name AS league,
     AVG(m.home_goal+m.away_goal)AS avg_goals,
    -- Rank leagues in descending order by average goals
    RANK() OVER(ORDER BY AVG(m.home_goal+m.away_goal) DESC) AS league_rank
FROM league AS l
LEFT JOIN match AS m 
ON l.id = m.country_id
WHERE m.season = '2011/2012'
GROUP BY l.name
-- Order the query by the rank you created
ORDER BY league_rank;