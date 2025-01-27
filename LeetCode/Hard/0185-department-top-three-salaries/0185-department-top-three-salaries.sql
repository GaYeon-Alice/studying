-- Write your PostgreSQL query statement below
WITH SalaryRank AS (
    SELECT name
         , salary
         , departmentId
         , DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS dr
    FROM Employee
)
SELECT d.name AS "Department"
     , r.name AS "Employee"
     , r.salary AS "Salary"
FROM SalaryRank AS r
     LEFT JOIN Department AS d ON r.departmentId = d.id
WHERE r.dr <= 3 