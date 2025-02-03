-- Write your PostgreSQL query statement below
WITH Manager AS (
    SELECT managerId AS id
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5
)
SELECT name
FROM Employee AS e
     JOIN Manager AS m USING (id)