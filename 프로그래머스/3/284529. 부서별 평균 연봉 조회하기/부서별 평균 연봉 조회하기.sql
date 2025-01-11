-- 코드를 작성해주세요
SELECT d.dept_id
     , d.dept_name_en
     , ROUND(AVG(e.sal), 0) AS avg_sal
FROM hr_department AS d
JOIN hr_employees AS e ON d.dept_id = e.dept_id
GROUP BY d.dept_id
       , d.dept_name_en
ORDER BY avg_sal DESC;