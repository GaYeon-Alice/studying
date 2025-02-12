-- 코드를 입력하세요
WITH JoinedUsers2021 AS (  -- 2021년에 가입한 전체 회원
    SELECT USER_ID
    FROM USER_INFO
    WHERE YEAR(JOINED) = 2021
)
SELECT YEAR(OS.SALES_DATE) AS YEAR
     , MONTH(OS.SALES_DATE) AS MONTH
     , COUNT(DISTINCT OS.USER_ID) AS PURCHASED_USERS
     , ROUND(COUNT(DISTINCT OS.USER_ID) / (SELECT COUNT(*) FROM JoinedUsers2021), 1) AS PURCHASED_RATIO
FROM JoinedUsers2021 AS JU
JOIN ONLINE_SALE AS OS ON JU.USER_ID = OS.USER_ID
GROUP BY YEAR
       , MONTH
ORDER BY YEAR
       , MONTH;