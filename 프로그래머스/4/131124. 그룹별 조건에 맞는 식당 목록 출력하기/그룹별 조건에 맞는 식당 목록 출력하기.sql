-- 코드를 입력하세요
WITH ReviewCounts AS (
    SELECT MEMBER_ID, COUNT(*) AS REVIEW_COUNT
    FROM REST_REVIEW
    GROUP BY MEMBER_ID
),
TopReviewers AS (
    -- 리뷰를 가장 많이 작성한 회원 추출
    SELECT MEMBER_ID, REVIEW_COUNT
    FROM ReviewCounts
    WHERE REVIEW_COUNT = (SELECT MAX(REVIEW_COUNT) FROM ReviewCounts)
)
SELECT MP.MEMBER_NAME
     , RR.REVIEW_TEXT
     , DATE_FORMAT(RR.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM MEMBER_PROFILE AS MP
JOIN REST_REVIEW AS RR ON MP.MEMBER_ID = RR.MEMBER_ID
JOIN TopReviewers AS TR ON MP.MEMBER_ID = TR.MEMBER_ID
ORDER BY RR.REVIEW_DATE
       , RR.REVIEW_TEXT