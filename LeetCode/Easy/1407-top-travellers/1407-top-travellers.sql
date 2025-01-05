# Write your MySQL query statement below
SELECT u.name
     , SUM(CASE WHEN r.distance IS NULL THEN 0 ELSE r.distance END) AS travelled_distance
FROM Users AS u
LEFT JOIN Rides AS r ON u.id = r.user_id
GROUP BY u.id
ORDER BY travelled_distance DESC
       , u.name;