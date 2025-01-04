# Write your MySQL query statement below
SELECT DISTINCT product_id
              , product_name
FROM Product
WHERE product_id IN (
    SELECT product_id
    FROM Sales
    WHERE sale_date BETWEEN '2019-01-01' AND '2019-03-31'
) AND product_id NOT IN (
    SELECT product_id
    FROM Sales
    WHERE sale_date BETWEEN '2019-04-01' AND '2019-12-31'
);