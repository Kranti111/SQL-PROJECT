# Histogram of Tweets – SQL Practice (DataLemur)

**📝 Problem**  
Write a SQL query to create a histogram of tweets posted per user in the year 2022.  
Group users by the number of tweets they posted and return how many users fall in each "tweet bucket".

**📊 Table: `tweets`**
| Column Name | Type     |
|-------------|----------|
| tweet_id    | integer  |
| user_id     | integer  |
| msg         | string   |
| tweet_date  | datetime |

**🧠 Sample Input:**
| tweet_id | user_id | msg                                                | tweet_date          |
|----------|---------|-----------------------------------------------------|---------------------|
| 214252   | 111     | Am considering taking Tesla private at $420...     | 2021-12-30 00:00:00 |
| 739252   | 111     | Despite the constant negative press covfefe        | 2022-01-01 00:00:00 |
| 846402   | 111     | Following @NickSinghTech on Twitter changed...     | 2022-02-14 00:00:00 |
| 241425   | 254     | If salary is competitive, why not show it?         | 2022-03-01 00:00:00 |
| 231574   | 148     | I no longer have a manager. I can't be managed     | 2022-03-23 00:00:00 |

**✅ Output:**
| tweet_bucket | users_num |
|--------------|-----------|
| 1            | 2         |
| 2            | 1         |

**📌 SQL Solution:**
```sql
WITH CTE AS (
    SELECT user_id, COUNT(*) AS tweet_bucket
    FROM tweets 
    WHERE EXTRACT(YEAR FROM tweet_date) = 2022 
    GROUP BY user_id
)   
SELECT tweet_bucket, COUNT(*) AS users_num 
FROM CTE 
GROUP BY tweet_bucket;
```

**📚 Source:** [DataLemur - Histogram of Tweets](https://datalemur.com/questions/histogram-tweets)
