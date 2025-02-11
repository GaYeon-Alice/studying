-- Write your PostgreSQL query statement below
SELECT 'Low Salary' AS category
     , COUNT(*) FILTER (WHERE income < 20000) AS accounts_count
FROM Accounts
UNION ALL
SELECT 'Average Salary' AS category
     , COUNT(*) FILTER (WHERE income BETWEEN 20000 AND 50000) AS accounts_count
FROM Accounts
UNION ALL
SELECT 'High Salary' AS category
     , COUNT(*) FILTER (WHERE income > 50000) AS accounts_count
FROM Accounts