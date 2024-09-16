-- 코드를 입력하세요
SELECT *
FROM (
    SELECT 
        C.CAR_ID,
        C.CAR_TYPE, 
        ROUND(C.DAILY_FEE * (1 - 0.01 * D.DISCOUNT_RATE) * 30, 0) AS FEE  -- 대여 금액 계산
    FROM 
        CAR_RENTAL_COMPANY_CAR AS C
    JOIN 
        CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS D
        ON C.CAR_TYPE = D.CAR_TYPE
    WHERE 
        C.CAR_TYPE IN ('세단', 'SUV')  -- 자동차 종류 필터
        AND D.DURATION_TYPE = '30일 이상'  -- 대여 기간 필터
        AND C.CAR_ID NOT IN (
            -- 2022년 11월 1일부터 11월 30일 사이에 대여가 불가능한 자동차 ID
            SELECT CAR_ID
            FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
            WHERE START_DATE <= '2022-11-30'
              AND END_DATE >= '2022-11-01'
        )
) AS TMP
WHERE 
    FEE >= 500000  -- 대여 금액 필터
    AND FEE < 2000000
ORDER BY 
    FEE DESC,      -- 대여 금액 내림차순
    CAR_TYPE,      -- 자동차 종류 오름차순
    CAR_ID DESC;   -- 자동차 ID 내림차순