# Write your MySQL query statement below
SELECT *
     , CASE
           WHEN (x <= z AND y <= z AND x + y > z)
             OR (x <= y AND z <= y AND x + z > y)
             OR (y <= x AND z <= x AND y + z > x) THEN 'Yes'
           ELSE 'No'
       END AS triangle
FROM
    Triangle;