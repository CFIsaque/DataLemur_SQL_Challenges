/*
Given a table of candidates and their skills, I've tasked with finding the candidates best suited for an open Data Science job (find candidates who are proficient in Python, Tableau, and PostgreSQL).

This query I wrote is to list the candidates who possess all of the required skills for the job. Sorted the output by candidate ID in ascending order.

*/

SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT SKILL) >=3
