# Write your MySQL query statement below
SELECT MAX(salary) AS SecondHighestSalary  -- 최댓값이 아닌 값들 중에서 최댓값 조회
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);