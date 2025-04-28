# Write your MySQL query statement below
WITH converted AS (
    SELECT user_id
    FROM useractivity
    WHERE activity_type = 'paid'
)
SELECT user_id
     , ROUND(AVG(CASE WHEN activity_type = 'free_trial' THEN activity_duration END), 2) AS trial_avg_duration
     , ROUND(AVG(CASE WHEN activity_type = 'paid' THEN activity_duration END), 2) AS paid_avg_duration
FROM useractivity
WHERE user_id IN (
    SELECT user_id
    FROM converted
)
GROUP BY user_id
ORDER BY user_id;