/*
In this script I've to return the recent transaction date and the amount of products by in this day for users.
In order to do that, I used the windows function to sorted the transactions date by the last and partition by users, 
count to get the amount of products and a subquery to get the users and products amount by last trasaction date
*/

SELECT  transaction_date, user_id, purchase_count 
FROM (

SELECT transaction_date, user_id, count(product_id) AS purchase_count,
ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date DESC) AS flag
FROM user_transactions
GROUP BY user_id, transaction_date
ORDER BY transaction_date) t
WHERE flag = 1;
