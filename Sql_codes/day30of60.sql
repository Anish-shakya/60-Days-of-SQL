
SELECT 
	date,
	season,
	home_goal,
	away_goal,
    -- case to identify if the team is in home or away
	CASE
		WHEN hometeam_id = 8673 THEN 'home' 
		ELSE 'away' END AS warsaw_location,
     --calculating average home goal for overall season
	AVG(home_goal) OVER(PARTITION BY season) AS season_homeavg,
    -- calculating average away goal for overall season
	AVG(away_goal) OVER(PARTITION BY season) AS season_awayavg
FROM match
WHERE 
-- filterting data for legia waeszawa's game only 
	hometeam_id = 8673
	OR awayteam_id = 8673
ORDER BY (home_goal+away_goal)


SELECT 
	date,
	season,
	home_goal,
	away_goal,
	CASE
		WHEN hometeam_id = 8673 THEN 'home'
		ELSE 'away' END AS warsaw_location,
    -- calculationg average home and away goal for season and months in each season
	AVG(home_goal) OVER(PARTITION BY season, EXTRACT(MONTH FROM date)) AS season_mo_home,
	AVG(away_goal) OVER(PARTITION BY season, EXTRACT(MONTH FROM date)) AS season_mo_away
FROM match 
WHERE hometeam_id = 8673
	  OR awayteam_id = 8673
ORDER BY (home_goal+away_goal) DESC