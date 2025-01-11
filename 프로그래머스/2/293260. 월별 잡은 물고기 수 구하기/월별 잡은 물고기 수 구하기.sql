-- 코드를 작성해주세요
SELECT COUNT(*) AS fish_count
     , MONTH(TIME) AS month
FROM fish_info
GROUP BY month
HAVING fish_count > 0
ORDER BY month;