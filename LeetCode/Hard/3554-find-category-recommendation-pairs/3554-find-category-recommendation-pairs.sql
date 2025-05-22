# Write your MySQL query statement below
WITH PurchaseInfo AS (
    SELECT p.user_id
         , p.product_id
         , i.category
    FROM ProductPurchases AS p
    JOIN ProductInfo AS i
        ON p.product_id = i.product_id
)
SELECT pi1.category AS category1
     , pi2.category AS category2
     , COUNT(DISTINCT pi1.user_id) AS customer_count
FROM PurchaseInfo AS pi1
JOIN PurchaseInfo AS pi2
    ON pi1.category < pi2.category
    AND pi1.user_id = pi2.user_id
GROUP BY category1, category2
HAVING customer_count >= 3
ORDER BY customer_count DESC, category1, category2;