# Write your MySQL query statement below
SELECT *
FROM products
WHERE description REGEXP '(^|[[:space:]])SN[0-9]{4}-[0-9]{4}( |$)'
ORDER BY product_id;