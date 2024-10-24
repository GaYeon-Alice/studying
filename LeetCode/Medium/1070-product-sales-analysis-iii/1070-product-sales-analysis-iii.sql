# Write your MySQL query statement below
WITH FirstYearSales AS (
    SELECT product_id
         , MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
)
SELECT fys.product_id
     , fys.first_year
     , s.quantity
     , s.price
FROM FirstYearSales AS fys
JOIN Sales AS s ON fys.product_id = s.product_id AND fys.first_year = s.year;