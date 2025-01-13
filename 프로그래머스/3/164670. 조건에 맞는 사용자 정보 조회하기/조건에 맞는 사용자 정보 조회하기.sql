-- 코드를 입력하세요
WITH ActiveUsers AS (
    SELECT writer_id
    FROM used_goods_board
    GROUP BY writer_id
    HAVING COUNT(*) >= 3
)
SELECT user_id
     , nickname
     , CONCAT(city, ' ', street_address1, ' ', street_address2) AS address
     , CONCAT(LEFT(tlno, 3), '-', MID(tlno, 4, 4), '-', RIGHT(tlno, 4)) AS phone
FROM used_goods_user
WHERE user_id IN (SELECT writer_id FROM ActiveUsers)
ORDER BY user_id DESC;