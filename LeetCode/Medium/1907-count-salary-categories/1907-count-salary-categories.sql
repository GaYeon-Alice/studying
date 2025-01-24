-- Write your PostgreSQL query statement below
WITH c AS (
    SELECT 'Low Salary' AS category
    UNION
    SELECT 'Average Salary' AS category
    UNION
    SELECT 'High Salary' AS category
)
SELECT c.category
     , COALESCE(COUNT(a.account_id), 0) AS accounts_count
FROM c
LEFT JOIN Accounts AS a
ON ( 
    (c.category = 'Low Salary' AND a.income < 20000)
    OR (c.category = 'Average Salary' AND a.income BETWEEN 20000 AND 50000)
    OR (c.category = 'High Salary' AND a.income > 50000)
)
GROUP BY c.category;