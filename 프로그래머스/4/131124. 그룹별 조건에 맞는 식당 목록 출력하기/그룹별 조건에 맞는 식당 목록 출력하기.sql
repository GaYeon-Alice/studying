-- 코드를 입력하세요
WITH ReviewCnts AS (
    SELECT member_id
         , COUNT(*) AS review_cnt
    FROM Rest_Review
    GROUP BY member_id
), TopReviewers AS (
    SELECT member_id
         , review_cnt
    FROM ReviewCnts
    WHERE review_cnt = (SELECT MAX(review_cnt) FROM ReviewCnts)
)
SELECT m.member_name
     , r.review_text
     , DATE_FORMAT(r.review_date, '%Y-%m-%d') AS review_date
FROM TopReviewers AS t
JOIN Member_Profile AS m ON t.member_id = m.member_id
JOIN Rest_Review AS r ON t.member_id = r.member_id
ORDER BY r.review_date
       , r.review_text;