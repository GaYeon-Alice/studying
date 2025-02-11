-- Write your PostgreSQL query statement below
WITH Numbers AS (
    SELECT num
         , LAG(num) OVER (ORDER BY id) AS prev_num
         , LEAD(num) OVER (ORDER BY id) AS next_num
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM Numbers
WHERE num = prev_num
  AND num = next_num