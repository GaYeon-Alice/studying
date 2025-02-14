-- 코드를 작성해주세요
WITH frontend AS (
    SELECT code
    FROM skillcodes
    WHERE category = 'Front End'
)
SELECT DISTINCT d.id
              , d.email
              , d.first_name
              , d.last_name
FROM developers AS d
JOIN frontend AS f
  ON d.skill_code & f.code
ORDER BY d.id;