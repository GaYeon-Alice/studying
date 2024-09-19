-- 코드를 입력하세요
SELECT
    MONTH(START_DATE) AS MONTH,
    CAR_ID,
    COUNT(*) AS RECORDS
FROM
    CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE
    START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    AND CAR_ID IN (
        -- 대여 시작일을 기준으로 2022년 8월부터 10월까지 총 대여 횟수가 5회 이상인 자동차 필터링
        SELECT
            CAR_ID
        FROM
            CAR_RENTAL_COMPANY_RENTAL_HISTORY
        WHERE
            START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
        GROUP BY
            CAR_ID
        HAVING
            COUNT(*) >= 5
    )
GROUP BY
    MONTH,
    CAR_ID
ORDER BY
    MONTH,
    CAR_ID DESC;