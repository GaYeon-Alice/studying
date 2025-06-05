-- Write your MySQL query statement below
WITH sales_season AS (
    SELECT product_id
         , quantity
         , price
         , CASE
             WHEN MONTH(sale_date) IN ('3', '4', '5') THEN 'Spring'
             WHEN MONTH(sale_date) IN ('6', '7', '8') THEN 'Summer'
             WHEN MONTH(sale_date) IN ('9', '10', '11') THEN 'Fall'
            ELSE 'Winter'
           END AS season
    FROM sales
), sales_rank AS (
    SELECT s.season
         , p.category
         , SUM(s.quantity) AS total_quantity
         , SUM(s.quantity * s.price) AS total_revenue
         , ROW_NUMBER() OVER (PARTITION BY season ORDER BY SUM(s.quantity) DESC, SUM(s.quantity * s.price) DESC) AS rn
    FROM sales_season AS s
    JOIN products AS p
        ON s.product_id = p.product_id
    GROUP BY season, category
)
SELECT season
     , category
     , total_quantity
     , total_revenue
FROM sales_rank
WHERE rn = 1
ORDER BY season;