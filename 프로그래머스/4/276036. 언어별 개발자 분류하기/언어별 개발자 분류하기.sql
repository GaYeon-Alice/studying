-- 코드를 작성해주세요
SELECT
    CASE
        -- A: Front End 스킬과 Python 스킬을 함께 가지고 있는 개발자
        WHEN MAX(CASE WHEN S.CATEGORY = 'Front End' THEN 1 ELSE 0 END) > 0
            AND MAX(CASE WHEN S.NAME = 'Python' THEN 1 ELSE 0 END) > 0 THEN 'A'
        -- B: C# 스킬을 가진 개발자
        WHEN MAX(CASE WHEN S.NAME = 'C#' THEN 1 ELSE 0 END) > 0 THEN 'B'
        -- C: 그 외의 Front End 개발자
        WHEN MAX(CASE WHEN S.CATEGORY = 'Front End' THEN 1 ELSE 0 END) > 0 THEN 'C' 
    END AS GRADE
    , D.ID
    , D.EMAIL
FROM
    DEVELOPERS AS D
JOIN
    SKILLCODES AS S
ON
    D.SKILL_CODE & S.CODE  -- SKILL_CODE와 CODE를 비트 연산하여 해당 개발자의 스킬을 필터링
GROUP BY
    D.ID
    , D.EMAIL
HAVING
    GRADE IS NOT NULL
ORDER BY
    GRADE
    , D.ID;