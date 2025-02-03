-- Write your PostgreSQL query statement below
SELECT s.user_id
     , ROUND(AVG(CASE WHEN c.action = 'confirmed' THEN 1.0 ELSE 0.0 END), 2) AS confirmation_rate
FROM signups AS s
LEFT JOIN confirmations AS c USING (user_id)
GROUP BY s.user_id;