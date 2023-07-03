SELECT * FROM web_events
LIMIT 10  ---Only 10 rows of data will be fetched

SELECT occurred_at,account_id,channel  -- only mention column will be fetched form table web_events
FROM web_events 
LIMIT 15 -- 15 rows of data will be displayed


SELECT * FROM orders 
ORDER BY account_id -- orders the result by accoun_id in ascending order
LIMIT 10

SELECT * FROM orders
ORDER BY account_id DESC -- orders the result by accoun_id in descending order
LIMIT 5  -- only 5 row will be fetch

-- Select account_id and total_amt_usd columns from the orders table
SELECT account_id, total_amt_usd
FROM orders
-- Order the results by account_id in ascending order and total_amt_usd in descending order
ORDER BY account_id, total_amt_usd DESC;


---using where clause to filter out the data

SELECT * 
FROM orders
WHERE account_id = 4251  -- only data with account_id 4251 will be fetch from the table
ORDER BY occurred_at
LIMIT 100
