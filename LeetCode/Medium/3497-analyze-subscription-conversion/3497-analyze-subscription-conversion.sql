# Write your MySQL query statement below
WITH converted AS (
    SELECT user_id
    FROM useractivity
    WHERE activity_type = 'paid'
)
SELECT ua.user_id
     , ROUND(AVG(CASE WHEN ua.activity_type = 'free_trial' THEN ua.activity_duration END), 2) AS trial_avg_duration
     , ROUND(AVG(CASE WHEN ua.activity_type = 'paid' THEN ua.activity_duration END), 2) AS paid_avg_duration
FROM useractivity AS ua
JOIN converted AS c
    ON ua.user_id = c.user_id
GROUP BY user_id
ORDER BY user_id;