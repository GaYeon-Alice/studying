# Write your MySQL query statement below
SELECT s.user_id
     , CASE
           WHEN c.action IS NOT NULL THEN ROUND(SUM(IF(c.action = 'confirmed', 1, 0)) / COUNT(c.time_stamp), 2)
           ELSE 0
       END AS confirmation_rate
FROM Signups AS s
LEFT JOIN Confirmations AS c ON s.user_id = c.user_id
GROUP BY s.user_id;