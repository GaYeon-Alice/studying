# Write your MySQL query statement below
WITH FirstOrder AS (
    SELECT customer_id
       , CASE
           WHEN MIN(order_date) = MIN(customer_pref_delivery_date) THEN 'immediate'
           ELSE 'scheduled'
       END AS status
    FROM Delivery
    GROUP BY customer_id
)
SELECT ROUND(COUNT(*) / (SELECT COUNT(DISTINCT customer_id) FROM Delivery) * 100, 2) AS immediate_percentage
FROM FirstOrder
WHERE status = 'immediate';