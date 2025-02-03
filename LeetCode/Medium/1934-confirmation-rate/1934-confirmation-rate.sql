-- Write your PostgreSQL query statement below
SELECT s.user_id
     , ROUND(COUNT(*) FILTER (WHERE action = 'confirmed')::decimal / COUNT(*), 2) AS confirmation_rate
FROM Signups AS s
     LEFT JOIN Confirmations AS c USING (user_id)
GROUP BY s.user_id