-- 코드를 입력하세요
SELECT YEAR(s.sales_date) AS year
     , MONTH(s.sales_date) AS month
     , u.gender
     , COUNT(DISTINCT u.user_id) AS users
FROM user_info AS u
JOIN online_sale AS s ON u.user_id = s.user_id
WHERE u.gender IS NOT NULL
GROUP BY year
       , month
       , u.gender
ORDER BY year
       , month
       , u.gender;