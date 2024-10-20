# Write your MySQL query statement below
SELECT employee_id
     , department_id
FROM Employee
WHERE primary_flag = 'Y'  -- 여러 부서에 속한 경우
   OR employee_id NOT IN (  -- 하나의 부서에 속한 경우
    SELECT employee_id
    FROM Employee
    WHERE primary_flag = 'Y'
);