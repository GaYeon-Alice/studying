-- Write your PostgreSQL query statement below
WITH converted AS (
    SELECT user_id
    FROM useractivity
    WHERE activity_type = 'paid'
)
SELECT ua.user_id
     , ROUND(AVG(ua.activity_duration) FILTER (WHERE ua.activity_type = 'free_trial'), 2) AS trial_avg_duration
     , ROUND(AVG(ua.activity_duration) FILTER (WHERE ua.activity_type = 'paid'), 2) AS paid_avg_duration
FROM useractivity AS ua
JOIN converted AS c
    ON ua.user_id = c.user_id
GROUP BY ua.user_id
ORDER BY ua.user_id;