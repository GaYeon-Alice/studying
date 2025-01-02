-- 코드를 입력하세요
SELECT P.PRODUCT_CODE
     , SUM(P.PRICE * OS.SALES_AMOUNT) AS SALES
FROM PRODUCT AS P
JOIN OFFLINE_SALE AS OS ON P.PRODUCT_ID = OS.PRODUCT_ID
GROUP BY P.PRODUCT_CODE
ORDER BY SALES DESC
       , P.PRODUCT_CODE;