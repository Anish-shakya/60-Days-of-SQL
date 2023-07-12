-- Setting up  CTE
WITH match_list AS (
    SELECT 
  		country_id, 
  		id
    FROM match
    WHERE (home_goal + away_goal) >= 10)
-- Select league and count of matches from the CTE
SELECT
    l.name AS league,
    COUNT(match_list.id) AS matches
FROM league AS l
-- Join the CTE to the league table
LEFT JOIN match_list ON l.id = match_list.country_id
GROUP BY l.name;


-- Setting up  CTE
WITH match_list AS (
  -- Select the league, date, home, and away goals
SELECT
   l.name as league,
   m.date,
   m.home_goal,
   m.away_goal,
   (m.home_goal+away_goal) AS total_goals
FROM match m 
LEFT JOIN league l ON m.country_id = l.id)
-- Select the league, date, home, and away goals from the CTE
SELECT 
  league,
  date,
  home_goal,
  away_goal
FROM match_list
-- Filter by total goals
WHERE total_goals >=10


-- Setting up  CTE
WITH match_list AS (
  -- Select the league, date, home, and away goals
SELECT
   l.name as league,
   m.date,
   m.home_goal,
   m.away_goal,
   (m.home_goal+away_goal) AS total_goals
FROM match m 
LEFT JOIN league l ON m.country_id = l.id)
-- Select the league, date, home, and away goals from the CTE
SELECT 
  league,
  date,
  home_goal,
  away_goal
FROM match_list
-- Filter by total goals
WHERE total_goals >=10