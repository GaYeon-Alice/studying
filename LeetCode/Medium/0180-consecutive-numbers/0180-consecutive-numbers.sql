# Write your MySQL query statement below
WITH Nums AS (
    SELECT *
         , LAG(num) OVER(ORDER BY id) AS prev_num
         , LEAD(num) OVER(ORDER BY id) AS next_num
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM Nums
WHERE prev_num = num
  AND num = next_num;