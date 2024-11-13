# Write your MySQL query statement below
SELECT e.name
FROM Employee AS m
LEFT JOIN Employee AS e ON m.managerId = e.id
GROUP BY m.managerId
HAVING COUNT(*) >= 5;  -- 5명 이상의 직원을 관리하는 관리자만 조회