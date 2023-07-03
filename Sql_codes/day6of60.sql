-- Select account_id, occurred_at, standard_qty, gloss_qty, poster_qty, and the sum of gloss_qty and poster_qty as total
SELECT 
    account_id,             -- Select the account_id column
    occurred_at,            -- Select the occurred_at column
    standard_qty,           -- Select the standard_qty column
    gloss_qty,              -- Select the gloss_qty column
    poster_qty,             -- Select the poster_qty column
    gloss_qty + poster_qty AS total -- Calculate the sum of gloss_qty and poster_qty as total
FROM 
    orders                  -- Select from the orders table
	
-- Select the id, calculate the percentage of standard_amt_usd out of total_amt_usd as std_percent, and select the total_amt_usd column
SELECT
    id, 
    (standard_amt_usd / total_amt_usd) * 100 AS std_percent, -- Calculate the percentage of standard_amt_usd out of total_amt_usd as std_percent
    total_amt_usd
FROM
    orders
LIMIT 10;

-- Select the id, account_id, and calculate the percentage of poster_amt_usd out of the sum of standard_amt_usd, gloss_amt_usd, and poster_amt_usd as post_per
SELECT
    id,
    account_id,
    poster_amt_usd / (standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per -- Calculate the percentage of poster_amt_usd out of the sum of standard_amt_usd, gloss_amt_usd, and poster_amt_usd as post_per
FROM
    orders
LIMIT 10;


--- using logical operators
-- using LIKE operator
SELECT * 
FROM web_events
WHERE channel LIKE 'd%'  -- filter by channel name which starts with letter d

--using IN Operator
SELECT * 
FROM orders
WHERE account_id IN(1001,1021) --filter table by account_id of 1001 and 1021 

--using NOT Operator
SELECT sales_rep_id,name
FROM accounts
WHERE sales_rep_id NOT IN(321500,321570) --filter table by Sales_rep_id not equal to 321500 and 321570
ORDER BY sales_rep_id

SELECT * 
FROM web_events
WHERE channel NOT LIKE 'd%'  -- filter by channel name which doesn't starts with letter d




