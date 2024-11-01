# Write your MySQL query statement below
WITH DailyAmount AS (  -- 일별 판매금액 합계
    SELECT visited_on
         , SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)
SELECT visited_on
     , SUM(amount) OVER 
        (ORDER BY visited_on
         ROWS 6 PRECEDING) AS amount  -- 현재 날짜까지 7일 간의 판매금액의 합계
     , ROUND(
        SUM(amount) OVER (
            ORDER BY visited_on
            ROWS 6 PRECEDING
        ) / 7
       , 2) AS average_amount  -- 현재 날짜까지 7일 간의 판매금액의 평균
FROM DailyAmount
GROUP BY visited_on
ORDER BY visited_on
LIMIT 6, 100;  -- 6번째 행까지 무시하고 7번째 행부터 100개의 행을 출력 (7 ~ 106)