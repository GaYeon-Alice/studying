# Write your MySQL query statement below
SELECT *
FROM products
WHERE description LIKE '%SN____-____ %'  -- 문장 중간에 serial number가 있는 경우
   OR description LIKE '%SN____-____'   -- 문장 끝에 serial number가 있는 경우
ORDER BY product_id;