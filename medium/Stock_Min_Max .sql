/*
This script display for each FAANG stock the ticker symbol, the month and year ('Mon-YYYY') with the corresponding highest and lowest open prices
The results are sorted by ticker symbol.

*/

SELECT ticker, 
  MAX(CASE WHEN max_open = 1 THEN teste END) AS highest_mth,
  MAX(CASE WHEN max_open = 1 THEN open END) AS highest_open,
  MAX(CASE WHEN low_open = 1 THEN teste END) AS lowest_mth,
  MAX(CASE WHEN low_open = 1 THEN open END) AS lowest_open
FROM
(SELECT ticker, open, low,  TO_CHAR(date, 'Mon-YYYY') AS teste,
RANK() OVER(PARTITION BY ticker ORDER BY open DESC) AS max_open,
RANK() OVER(PARTITION BY ticker ORDER BY open ASC) AS low_open 
FROM stock_prices) t
GROUP BY ticker
ORDER BY ticker;
