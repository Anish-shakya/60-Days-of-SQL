--using INNER JOIN
-- Select all columns from the orders table and join it with the accounts table
SELECT *
FROM orders -- Select all columns from the orders table
JOIN accounts -- Join the orders table with the accounts table
ON orders.account_id = accounts.id;-- based on the account_id and id columns


---Inner join -------
SELECT accounts.id,accounts.name,orders.total_amt_usd as total_order FROM accounts 
JOIN orders 
ON accounts.id =orders.account_id

---- Right Join------
SELECT accounts.id,accounts.name,orders.total_amt_usd as total_order FROM accounts 
RIGHT JOIN orders 
ON accounts.id =orders.account_id

---- Left Join------
SELECT accounts.id,accounts.name,orders.total_amt_usd as total_order FROM accounts 
LEFT JOIN orders 
ON accounts.id =orders.account_id

---- Full Join------
SELECT accounts.id,accounts.name,orders.total_amt_usd as total_order FROM accounts 
FULL JOIN orders 
ON accounts.id =orders.account_id



