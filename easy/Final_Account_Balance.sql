/*
Given a table containing information about bank deposits and withdrawals made using Paypal, 
I had to write a query to retrieve the final account balance for each account,
taking into account all the transactions recorded in the table with the assumption that there are no missing transactions.

*/

WITH tabela as (SELECT account_id,
  CASE 
      WHEN transaction_type = 'Deposit' THEN SUM(amount)
  END AS deposit,
  CASE 
      WHEN transaction_type = 'Withdrawal' THEN SUM(amount)
  END AS withdrawal
FROM transactions
GROUP BY account_id, transaction_type)

SELECT account_id, SUM(deposit) - SUM(withdrawal) AS final_balance
FROM tabela
GROUP BY account_id;
