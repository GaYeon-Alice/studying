-- 코드를 작성해주세요
SELECT CASE
            WHEN SUM(CASE WHEN s.category = 'Front End' THEN 1 ELSE 0 END) > 0 
             AND SUM(CASE WHEN s.name = 'Python' THEN 1 ELSE 0 END) > 0 THEN 'A'
            WHEN SUM(CASE WHEN s.name = 'C#' THEN 1 ELSE 0 END) > 0 THEN 'B'
            WHEN SUM(CASE WHEN s.category = 'Front End' THEN 1 ELSE 0 END) > 0 THEN 'C'
       END AS grade
     , d.id
     , d.email
FROM developers AS d
JOIN skillcodes AS s
  ON d.skill_code & s.code
GROUP BY d.id, d.email
HAVING grade IS NOT NULL
ORDER BY grade, d.id;