-- Write your PostgreSQL query statement below
SELECT n.id
FROM Weather AS t
     JOIN Weather AS n ON t.recordDate + INTERVAL '+1 DAY' = n.recordDate
WHERE n.temperature > t.temperature