-- 코드를 입력하세요
SELECT
    I.NAME,
    I.DATETIME
FROM
    ANIMAL_INS AS I
LEFT JOIN
    ANIMAL_OUTS AS O
    ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE
    O.ANIMAL_ID IS NULL  -- 아직 입양을 못 간 동물 필터링
ORDER BY
    I.DATETIME  -- 보호소에 들어온 순서대로 정렬
LIMIT 3;  -- 가장 오래 보호소에 있었던 동물 3마리 조회