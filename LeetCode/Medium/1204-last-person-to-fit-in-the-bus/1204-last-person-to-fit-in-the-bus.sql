# Write your MySQL query statement below
WITH TotalWeight AS (
    SELECT person_name
         , SUM(weight) OVER (ORDER BY turn ROWS UNBOUNDED PRECEDING) AS total_weight  -- 몸무게 누적 합
    FROM Queue
    ORDER BY turn
)
SELECT person_name
FROM TotalWeight
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;