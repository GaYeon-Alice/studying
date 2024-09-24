-- 코드를 입력하세요
SELECT
    R.HISTORY_ID
    , FLOOR(
        (C.DAILY_FEE * (DATEDIFF(R.END_DATE, R.START_DATE) + 1)
         * (1 - 0.01 * COALESCE(D.DISCOUNT_RATE, 0)))
    ) AS FEE  -- 할인율이 적용된 대여 금액 계산
FROM
    CAR_RENTAL_COMPANY_CAR AS C
    JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY AS R
        ON C.CAR_ID = R.CAR_ID
    LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS D
        ON C.CAR_TYPE = D.CAR_TYPE
        AND (
            (D.DURATION_TYPE = '7일 이상' AND DATEDIFF(R.END_DATE, R.START_DATE) + 1 BETWEEN 7 AND 29)
            OR (D.DURATION_TYPE = '30일 이상' AND DATEDIFF(R.END_DATE, R.START_DATE) + 1 BETWEEN 30 AND 89)
            OR (D.DURATION_TYPE = '90일 이상' AND DATEDIFF(R.END_DATE, R.START_DATE) + 1 >= 90)
    )  -- 대여 기간에 따른 할인율 적용
WHERE
    C.CAR_TYPE = '트럭'
ORDER BY
    FEE DESC  -- 대여 금액을 기준으로 내림차순 정렬
    , R.HISTORY_ID DESC;  -- 대여 기록 ID를 기준으로 내림차순 정렬