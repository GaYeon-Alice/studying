# Write your MySQL query statement below
WITH TopThree AS (
    SELECT d.name AS Department
         , e.name AS Employee
         , e.salary AS Salary
         , DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS SalaryRank  -- 부서별 급여 순위
    FROM Employee AS e
    LEFT JOIN Department AS d ON e.departmentId = d.id
)
SELECT Department
     , Employee
     , Salary
FROM TopThree
WHERE SalaryRank <= 3;  -- 각 부서별로 급여가 상위 3개인 직원만 추출