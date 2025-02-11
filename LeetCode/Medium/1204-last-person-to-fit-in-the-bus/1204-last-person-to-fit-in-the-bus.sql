-- Write your PostgreSQL query statement below
SELECT person_name
FROM (
    SELECT person_name
         , SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
) AS tw
WHERE tw.total_weight <= 1000
ORDER BY tw.total_weight DESC
LIMIT 1