-- Write your PostgreSQL query statement below
WITH salary_rank AS (
    SELECT name
         , salary
         , departmentId
         , DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS dr
    FROM employee
)
SELECT d.name AS "Department"
     , r.name AS "Employee"
     , r.salary AS "Salary"
FROM salary_rank AS r
     JOIN department AS d ON r.departmentId = d.id
WHERE r.dr <= 3 