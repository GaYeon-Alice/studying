# Write your MySQL query statement below
SELECT name
FROM SalesPerson
WHERE name NOT IN (
    SELECT sp.name
    FROM SalesPerson AS sp
    JOIN Orders AS o ON sp.sales_id = o.sales_id
    JOIN Company AS c ON o.com_id = c.com_id
    WHERE c.name = 'RED'
);