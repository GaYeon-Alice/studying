-- 코드를 입력하세요
SELECT P.PRODUCT_ID
     , P.PRODUCT_NAME
     , SUM(P.PRICE * O.AMOUNT) AS TOTAL_SALES  -- 총매출: 식품 가격 * 주문량
FROM FOOD_PRODUCT AS P
JOIN FOOD_ORDER AS O ON P.PRODUCT_ID = O.PRODUCT_ID
WHERE O.PRODUCE_DATE LIKE '2022-05%'  -- 생산일자가 2022년 5월인 식품만 조회
GROUP BY P.PRODUCT_ID
ORDER BY TOTAL_SALES DESC
       , P.PRODUCT_ID;