--using INNER JOIN
-- Select all columns from the orders table and join it with the accounts table
SELECT *
FROM orders -- Select all columns from the orders table
JOIN accounts -- Join the orders table with the accounts table
ON orders.account_id = accounts.id;-- based on the account_id and id columns



SELECT orders.standard_qty, orders.gloss_qty, 
          orders.poster_qty,  accounts.website, 
          accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id