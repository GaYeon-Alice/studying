-- 코드를 입력하세요
WITH users AS (
    SELECT user_id
    FROM user_info
    WHERE YEAR(joined) = 2021
)
SELECT YEAR(s.sales_date) AS year
     , MONTH(s.sales_date) AS month
     , COUNT(DISTINCT s.user_id) AS purchased_users
     , ROUND(COUNT(DISTINCT s.user_id) / (SELECT COUNT(*) FROM users), 1) AS purchased_ratio
FROM users AS u
JOIN online_sale AS s
  ON u.user_id = s.user_id
GROUP BY YEAR(s.sales_date), MONTH(s.sales_date)
ORDER BY year, month;