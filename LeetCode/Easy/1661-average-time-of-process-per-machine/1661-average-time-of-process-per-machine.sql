-- Write your PostgreSQL query statement below
SELECT machine_id
     , ROUND(SUM(CASE WHEN activity_type = 'start' THEN -timestamp ELSE timestamp END)::numeric / COUNT(DISTINCT process_id), 3) AS processing_time
FROM Activity
GROUP BY machine_id