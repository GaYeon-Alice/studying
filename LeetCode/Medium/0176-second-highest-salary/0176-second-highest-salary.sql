-- Write your PostgreSQL query statement below
SELECT MAX(salary) AS "SecondHighestSalary"
FROM (
    SELECT salary
         , DENSE_RANK() OVER (ORDER BY salary) AS dr
    FROM Employee
) AS rk
WHERE rk.dr = 2