-- Write your PostgreSQL query statement below
WITH LatestChange AS (
    SELECT DISTINCT product_id
                  , FIRST_VALUE (new_price) OVER (PARTITION BY product_id ORDER BY change_date DESC) AS price
    FROM Products
    WHERE change_date <= '2019-08-16'
)
SELECT DISTINCT product_id
              , COALESCE(price, 10) AS price
FROM Products AS p
     LEFT JOIN LatestChange AS l USING (product_id)