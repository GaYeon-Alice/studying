-- Write your PostgreSQL query statement below
-- 사용자별 구매 상품과 해당 상품의 카테고리 정보 결합
WITH PurchaseInfo AS (
    SELECT p.user_id
         , p.product_id
         , i.category
    FROM ProductPurchases AS p
    JOIN ProductInfo AS i
        ON p.product_id = i.product_id
)

-- 동일 사용자가 함께 구매한 서로 다른 두 상품 쌍 추출
SELECT pi1.product_id AS product1_id
     , pi2.product_id AS product2_id
     , pi1.category AS product1_category
     , pi2.category AS product2_category
     , COUNT(*) AS customer_count  -- 함께 구매한 사용자 수
FROM PurchaseInfo AS pi1
JOIN PurchaseInfo AS pi2
    ON pi1.product_id < pi2.product_id
    AND pi1.user_id = pi2.user_id
GROUP BY product1_id, product2_id, product1_category, product2_category
HAVING COUNT(*) >= 3  -- 최소 3명의 사용자가 함께 구매한 상품 쌍만 추출
ORDER BY customer_count DESC, product1_id, product2_id;