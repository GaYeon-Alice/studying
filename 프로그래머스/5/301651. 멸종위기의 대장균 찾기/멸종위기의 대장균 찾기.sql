# -- 코드를 작성해주세요
WITH RECURSIVE GENERATION AS (
    -- 1세대 대장균을 선택
    SELECT
        ID
        , PARENT_ID
        , 1 AS GENERATION
    FROM
        ECOLI_DATA
    WHERE
        PARENT_ID IS NULL
    UNION ALL
    -- 세대 구분
    SELECT
        E.ID
        , E.PARENT_ID
        , G.GENERATION + 1
    FROM
        ECOLI_DATA AS E
    INNER JOIN
        GENERATION AS G
    ON
        E.PARENT_ID = G.ID
)

-- 세대별 자식이 없는 대장균 개체의 수를 계산
SELECT
    COUNT(*) AS COUNT
    , G.GENERATION AS GENERATION
FROM
    GENERATION AS G
LEFT JOIN
    ECOLI_DATA AS E
ON
    G.ID = E.PARENT_ID
WHERE
    E.PARENT_ID IS NULL
GROUP BY
    GENERATION
ORDER BY
    GENERATION;