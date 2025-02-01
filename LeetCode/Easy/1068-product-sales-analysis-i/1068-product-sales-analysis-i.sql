-- Write your PostgreSQL query statement below
SELECT p.product_name
     , s.year
     , s.price
FROM Sales AS s
     JOIN Product AS p USING (product_id)