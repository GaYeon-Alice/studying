-- Write your PostgreSQL query statement below
SELECT TO_CHAR(trans_date, 'YYYY-MM') AS month
     , country
     , COUNT(*) AS trans_count
     , COUNT(*) FILTER (WHERE state = 'approved') AS approved_count
     , SUM(amount) AS trans_total_amount
     , SUM(amount) FILTER (WHERE state = 'approved') AS approved_total_amount
FROM Transactions
GROUP BY month, country;