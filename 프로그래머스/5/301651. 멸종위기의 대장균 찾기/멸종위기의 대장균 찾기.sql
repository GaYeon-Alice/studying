# -- 코드를 작성해주세요
WITH RECURSIVE generation AS (
    -- 1세대 대장균을 선택
    SELECT id
         , parent_id
         , 1 AS generation
    FROM ecoli_data
    WHERE parent_id IS NULL
    UNION ALL
    -- 세대 구분
    SELECT e.id
         , e.parent_id
         , g.generation + 1
    FROM ecoli_data AS e
    JOIN generation AS g
      ON e.parent_id = g.id
)
-- 세대별 자식이 없는 대장균 개체의 수를 계산
SELECT COUNT(*) AS count
     , g.generation AS generation
FROM generation AS g
LEFT JOIN ecoli_data AS e
  ON g.id = e.parent_id
WHERE e.parent_id IS NULL
GROUP BY generation
ORDER BY generation;