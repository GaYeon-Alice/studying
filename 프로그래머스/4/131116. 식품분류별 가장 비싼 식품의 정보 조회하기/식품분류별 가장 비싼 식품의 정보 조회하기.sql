-- 코드를 입력하세요
SELECT
    CATEGORY
    , PRICE
    , PRODUCT_NAME
FROM
    FOOD_PRODUCT
WHERE
    (CATEGORY, PRICE) IN (
        -- 식품 분류별로 가격이 제일 비싼 식품을 필터링
        SELECT CATEGORY, MAX(PRICE)
        FROM FOOD_PRODUCT
        GROUP BY CATEGORY
        HAVING CATEGORY IN ('과자', '국', '김치', '식용유')
    )
ORDER BY
    PRICE DESC;