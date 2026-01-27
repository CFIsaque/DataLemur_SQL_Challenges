/*
You're given two tables containing data on Spotify users' streaming activity: songs_history which has historical streaming data, and songs_weekly which has data from the current week.

Assume that there may be new users or songs in the songs_weekly table that are not present in the songs_history table.

I wrote a query that outputs the user ID, song ID, and cumulative count of song plays up to August 4th, 2022, sorted in descending order.

*/



WITH united as (SELECT user_id, song_id, song_plays
FROM songs_history

UNION ALL

SELECT user_id, song_id, count(song_id) as song_plays
FROM songs_weekly
WHERE listen_time < '08-05-2022'
GROUP BY user_id, song_id)

SELECT user_id, song_id, sum(song_plays) as song_plays
FROM united
GROUP BY user_id, song_id
ORDER BY song_plays DESC;
