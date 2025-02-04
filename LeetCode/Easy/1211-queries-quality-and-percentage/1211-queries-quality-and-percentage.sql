-- Write your PostgreSQL query statement below
SELECT query_name
     , ROUND(SUM(rating * 1.0 / position) / COUNT(*), 2) AS quality
     , ROUND(COUNT(rating) FILTER (WHERE rating < 3) * 100.0 / COUNT(*), 2) AS poor_query_percentage
FROM queries
WHERE query_name IS NOT NULL
GROUP BY query_name;