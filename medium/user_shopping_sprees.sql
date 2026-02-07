/*
I filtered the user IDs who have gone on at least 1 shopping spree in ascending order.
*/


SELECT user_id FROM (SELECT user_id,amount, transaction_date,
RANK () OVER (PARTITION BY user_id ORDER BY transaction_date) as flag
FROM transactions) t
WHERE flag >= 3;
