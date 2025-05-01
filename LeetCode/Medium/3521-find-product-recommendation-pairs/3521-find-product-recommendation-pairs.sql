# Write your MySQL query statement below
WITH purchaseinfo AS (
    SELECT p.user_id
         , p.product_id
         , i.category
    FROM productpurchases AS p
    JOIN productinfo AS i
        ON p.product_id = i.product_id
)
SELECT pi1.product_id AS product1_id
     , pi2.product_id AS product2_id
     , pi1.category AS product1_category
     , pi2.category AS product2_category
     , COUNT(*) AS customer_count
FROM purchaseinfo AS pi1
JOIN purchaseinfo AS pi2
    ON pi1.product_id < pi2.product_id
    AND pi1.user_id = pi2.user_id
GROUP BY product1_id, product2_id
HAVING customer_count >= 3
ORDER BY customer_count DESC, product1_id, product2_id;