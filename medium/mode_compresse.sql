/*
Task:
Write a query to retrieve the mode of order occurrences.
Additionally, if there are multiple items with the same frequency (i.e., multiple modes), the results should be sorted in ascending order.

Answer:
Since SQL does not have a native function to calculate the mode, I used the window function RANK() to identify the highest frequency, including ties when they exist.
A subquery was used to make the ranking result available for filtering

*/


SELECT item_count 
FROM (
SELECT item_count, order_occurrences,
RANK() OVER(ORDER BY order_occurrences DESC) AS flag
FROM items_per_order) t
WHERE flag = 1;
