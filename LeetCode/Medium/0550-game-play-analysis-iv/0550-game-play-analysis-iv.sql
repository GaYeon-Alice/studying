# Write your MySQL query statement below
WITH LoginHistory AS (
    SELECT player_id
         , MIN(event_date) AS first_login  -- 첫 로그인 날짜
    FROM Activity
    GROUP BY player_id
)
-- 처음 로그인한 날부터 그다음 날까지 이틀 연속으로 로그인한 사용자만 조회
SELECT ROUND(SUM(IF(lh.first_login + 1 = a.event_date, 1, 0)) / COUNT(DISTINCT a.player_id), 2) AS fraction  
FROM Activity AS a
JOIN LoginHistory AS lh ON a.player_id = lh.player_id;