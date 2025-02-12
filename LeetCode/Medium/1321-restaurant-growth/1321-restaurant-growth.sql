-- Write your PostgreSQL query statement below
WITH DailySales AS (
    SELECT visited_on
         , SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)
SELECT visited_on
     , SUM(amount) OVER (ORDER BY visited_on ROWS 6 PRECEDING) AS amount
     , ROUND(AVG(amount) OVER (ORDER BY visited_on ROWS 6 PRECEDING), 2) AS average_amount
FROM DailySales
ORDER BY visited_on
OFFSET 6