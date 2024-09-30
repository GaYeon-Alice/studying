-- 코드를 작성해주세요
SELECT
    COUNT(*) AS COUNT
FROM
    ECOLI_DATA
WHERE
    (GENOTYPE & 1 OR GENOTYPE & 4)  -- 1번이나 3번 형질을 보유하고 있고
    AND NOT GENOTYPE & 2  -- 2번 형질을 보유하지 않은 대장균 조회