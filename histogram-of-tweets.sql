-- Histogram of Tweets (DataLemur SQL Question)
-- Query to group users by number of tweets posted in 2022

WITH CTE AS (
    SELECT user_id, COUNT(*) AS tweet_bucket
    FROM tweets 
    WHERE EXTRACT(YEAR FROM tweet_date) = 2022 
    GROUP BY user_id
)   
SELECT tweet_bucket, COUNT(*) AS users_num 
FROM CTE 
GROUP BY tweet_bucket;
