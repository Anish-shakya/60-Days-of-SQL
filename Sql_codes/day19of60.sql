SELECT 
	-- Select the date, home goals, and away goals scored
    date,
	home_goal,
	away_goal
FROM  matches_2013_2014
-- Filter for matches where total goals exceeds 3x the average
WHERE (home_goal +away_goal) > 
       (SELECT 3 * AVG(home_goal + away_goal)
        FROM matches_2013_2014); 

SELECT 
	-- Select the team long and short names
	team_long_name,
	team_short_name
FROM team
-- Exclude all values from the subquery
WHERE team_api_id NOT IN
     (SELECT DISTINCT hometeam_id  FROM match );

SELECT
	-- Select the team long and short names
	team_long_name,
	team_short_name
	
FROM team
-- Filter for teams with 8 or more home goals
WHERE team_api_id IN
	  (SELECT  hometeam_id
       FROM match
       WHERE  home_goal>= 8 );





