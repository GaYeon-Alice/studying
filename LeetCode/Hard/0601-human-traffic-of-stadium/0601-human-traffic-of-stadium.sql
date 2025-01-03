# Write your MySQL query statement below
WITH IdGap AS (  -- 이전 행과의 아이디 차이를 계산
    SELECT *
         , id - LAG(id) OVER (ORDER BY id) AS id_gap
    FROM Stadium
    WHERE people >= 100
), GroupId AS (  -- 연속 여부를 판단하여 그룹 아이디 생성
    SELECT id
         , visit_date
         , people
         , SUM(CASE
                   WHEN id_gap IS NULL OR id_gap = 1 THEN 0  -- 연속된 경우 기존 그룹 유지
                   ELSE 1  -- 연속되지 않은 경우 새 그룹 시작
               END) OVER (ORDER BY id) AS group_id  -- 누적 합으로 그룹 아이디 생성
    FROM IdGap
)
SELECT id
     , visit_date
     , people
FROM GroupId
WHERE group_id IN (  -- 3개 이상의 연속된 아이디로 구성된 그룹만 선택
    SELECT group_id
    FROM GroupId
    GROUP BY group_id
    HAVING COUNT(*) >= 3
)
ORDER BY visit_date;