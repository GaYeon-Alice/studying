# Write your MySQL query statement below
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1  -- tiv_2015가 중복되는 경우
)
  AND (lat, lon) IN (
    SELECT lat
         , lon
    FROM Insurance
    GROUP BY lat
           , lon
    HAVING COUNT(*) = 1  -- (lat, lon)이 중복되지 않는 경우
);