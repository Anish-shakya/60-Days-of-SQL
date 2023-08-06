-- Use coalesce
SELECT coalesce(industry, sector, 'Unknown') AS industry2,
       -- Don't forget to count!
       count(*) 
  FROM fortune500 
-- Group by what? (What are you counting by?)
 GROUP BY industry2
-- Order results to see most common first
 ORDER BY count DESC
-- Limit results to get just the one value you want
 LIMIT 1;



 SELECT company_original.name, title, rank
  -- Start with original company information
  FROM company AS company_original
       -- Join to another copy of company with parent
       -- company information
	   LEFT JOIN company AS company_parent
       ON company_original.parent_id = company_parent.id 
       -- Join to fortune500, only keep rows that match
       INNER JOIN fortune500 
       -- Use parent ticker if there is one, 
       -- otherwise original ticker
       ON coalesce(company_parent.ticker, 
                   company_original.ticker) = 
             fortune500.ticker
 -- For clarity, order by rank
 ORDER BY rank; 
 

 -- Select the original value
SELECT profits_change , 
	   -- Cast profits_change
       CAST(profits_change AS INTEGER) AS profits_change_int
  FROM fortune500;


  -- Correlation between revenues and profit
SELECT corr(revenues,profits) AS rev_profits,
	   -- Correlation between revenues and assets
       corr(revenues,assets)AS rev_assets,
       -- Correlation between revenues and equity
       corr(revenues,equity) AS rev_equity 
  FROM fortune500;

  -- What groups are you computing statistics by?
SELECT sector,
       -- Select the mean of assets with the avg function
       AVG(assets) AS mean,
       -- Select the median
       Percentile_disc(0.5) WITHIN GROUP (ORDER BY assets) AS median
  FROM fortune500
 -- Computing statistics for each what?
 GROUP BY sector
 -- Order results by a value of interest
 ORDER BY mean;


 
-- Fill in the command below with the name of the temp table
DROP TABLE IF EXISTS recode;

-- Create and name the temporary table
CREATE TEMP TABLE recode AS
-- Write the select query to generate the table 
-- with distinct values of category and standardized values
  SELECT DISTINCT category, 
         RTRIM(SPLIT_PART(category, '-', 1)) AS standardized
    -- What table are you selecting the above values from?
    FROM evanston311;
    
-- Look at a few values before the next step
SELECT DISTINCT standardized 
  FROM recode
 WHERE standardized LIKE 'Trash%Cart'
    OR standardized LIKE 'Snow%Removal%';