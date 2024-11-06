# Write your MySQL query statement below
WITH LatestChanges AS (
    SELECT product_id
         , MAX(CASE WHEN change_date <= '2019-08-16' THEN change_date END) AS change_date  -- 제품별로 가장 최근에 가격이 변동된 날짜 조회
    FROM Products
    GROUP BY product_id
)
SELECT lc.product_id
     , COALESCE(p.new_price, 10) AS price  -- 가격 변동이 있었다면 변동된 가격을, 없었다면 10을 출력
FROM LatestChanges AS lc
LEFT JOIN Products AS p ON lc.product_id = p.product_id AND p.change_date = lc.change_date;