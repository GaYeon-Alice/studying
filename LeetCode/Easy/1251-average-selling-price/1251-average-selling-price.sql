# Write your MySQL query statement below
SELECT p.product_id
     , CASE
         WHEN us.units IS NULL THEN 0
         ELSE ROUND((SUM(p.price * us.units) / SUM(us.units)), 2)
       END AS average_price
FROM Prices AS p
LEFT JOIN UnitsSold AS us ON p.product_id = us.product_id
WHERE us.product_id IS NULL
   OR us.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;