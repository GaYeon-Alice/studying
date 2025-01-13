-- 코드를 입력하세요
WITH ActiveUsers AS (
    SELECT writer_id
    FROM used_goods_board
    GROUP BY writer_id
    HAVING COUNT(*) >= 3
)
SELECT u.user_id
     , u.nickname
     , CONCAT(u.city, ' ', u.street_address1, ' ', u.street_address2) AS address
     , CONCAT(LEFT(u.tlno, 3), '-', MID(u.tlno, 4, 4), '-', RIGHT(u.tlno, 4)) AS phone
FROM used_goods_user AS u
JOIN ActiveUsers AS au ON u.user_id = au.writer_id
ORDER BY u.user_id DESC;