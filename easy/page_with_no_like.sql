/*
Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").

I wrote a query to return the IDs of the Facebook pages that have zero likes. The output is sorted in ascending order based on the page IDs

*/

SELECT p.page_id
FROM pages p
LEFT JOIN page_likes l
on p.page_id = l.page_id
WHERE l.liked_date is NULL
ORDER BY p.page_id
