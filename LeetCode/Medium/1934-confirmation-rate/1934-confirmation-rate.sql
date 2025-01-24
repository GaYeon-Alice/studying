-- Write your PostgreSQL query statement below
SELECT s.user_id
     , ROUND(COUNT(*) FILTER (WHERE c.action = 'confirmed') / COUNT(*)::decimal, 2) AS confirmation_rate
FROM signups AS s
LEFT JOIN confirmations AS c USING (user_id)
GROUP BY s.user_id;