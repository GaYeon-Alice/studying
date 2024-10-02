-- 코드를 작성해주세요
SELECT
    FI.ID
    , FNI.FISH_NAME
    , FI.LENGTH
FROM
    FISH_INFO AS FI
JOIN
    FISH_NAME_INFO AS FNI
ON
    FI.FISH_TYPE = FNI.FISH_TYPE
WHERE
    (FI.FISH_TYPE, FI.LENGTH) IN (
        SELECT
            FISH_TYPE
            , MAX(LENGTH)
        FROM
            FISH_INFO
        GROUP BY
            FISH_TYPE
    )  -- 물고기 종류별 가장 큰 물고기의 길이 조회
ORDER BY
    ID;