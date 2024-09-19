-- 코드를 입력하세요
SELECT
    FOOD_TYPE,
    REST_ID,
    REST_NAME,
    FAVORITES
FROM
    REST_INFO
WHERE 
    (FOOD_TYPE, FAVORITES) IN (
        -- 음식 종류별로 즐겨찾기 수가 가장 많은 식당을 필터링
        SELECT FOOD_TYPE, MAX(FAVORITES)
        FROM REST_INFO
        GROUP BY FOOD_TYPE
    )
ORDER BY
    FOOD_TYPE DESC;