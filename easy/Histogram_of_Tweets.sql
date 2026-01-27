/*
I grouped the users by the number of tweets they posted in 2022 and counted the number of users in each group
*/


WITH tabela as (SELECT user_id, count(msg) as teste 
FROM tweets
WHERE EXTRACT(YEAR FROM tweet_date) = 2022
GROUP BY user_id)

SELECT teste as tweet_bucket, count(user_id) as users_num
FROM tabela
GROUP BY teste
