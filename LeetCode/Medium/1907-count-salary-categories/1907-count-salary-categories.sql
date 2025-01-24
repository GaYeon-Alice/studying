-- Write your PostgreSQL query statement below
WITH c AS (
    SELECT 'Low Salary' AS category
    UNION
    SELECT 'Average Salary' AS category
    UNION
    SELECT 'High Salary' AS category
)
SELECT 
    c.category,
    COALESCE(accounts_count, 0) AS accounts_count
FROM c
LEFT JOIN (
    SELECT CASE
                WHEN income < 20000 THEN 'Low Salary'
                WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
                WHEN income > 50000 THEN 'High Salary'
           END AS category
         , COUNT(*) AS accounts_count
    FROM Accounts
    GROUP BY category
) AS cnt ON c.category = cnt.category