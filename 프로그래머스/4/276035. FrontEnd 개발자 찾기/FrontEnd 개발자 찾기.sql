-- 코드를 작성해주세요
WITH FrontEnd AS (
    SELECT CODE
    FROM SKILLCODES
    WHERE CATEGORY = 'Front End'
)
SELECT DISTINCT D.ID
              , D.EMAIL
              , D.FIRST_NAME
              , D.LAST_NAME
FROM DEVELOPERS AS D
JOIN FrontEnd AS FE ON D.SKILL_CODE & FE.CODE
ORDER BY D.ID;