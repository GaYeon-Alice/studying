-- Write your PostgreSQL query statement below
SELECT v.customer_id
     , COUNT(*) AS count_no_trans
FROM Visits AS v
     LEFT JOIN Transactions AS t USING (visit_id)
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id