/*
Task:
Write a query that outputs the name of the credit card and how many cards were issued in its launch month.
The launch month is defined as the earliest record in the monthly_cards_issued table for each card.
Order the results by the highest issued amount first.

Answer:
To identify the launch month for each credit card, I used the window function ROW_NUMBER(),
partitioned by card_name and ordered by issue_year and issue_month in ascending order.
This assigns row number 1 to the earliest record for each card.
Then, I used a subquery to filter only the launch month records and ordered the results
by issued_amount in descending order.

*/


SELECT card_name, issued_amount FROM 
(SELECT *,
ROW_NUMBER() OVER(PARTITION BY card_name ORDER BY issue_year, issue_month) AS flag
FROM monthly_cards_issued) t
WHERE flag = 1
ORDER BY issued_amount DESC;
