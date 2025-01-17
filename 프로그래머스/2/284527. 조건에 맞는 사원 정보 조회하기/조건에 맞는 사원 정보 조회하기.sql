-- 코드를 작성해주세요
WITH EmpScore AS (
    SELECT emp_no
         , SUM(score) AS total_score
    FROM hr_grade
    GROUP BY emp_no
)
SELECT s.total_score AS score
     , e.emp_no
     , e.emp_name
     , e.position
     , e.email
FROM hr_employees AS e
JOIN EmpScore AS s ON e.emp_no = s.emp_no
WHERE s.total_score = (
    SELECT MAX(total_score)
    FROM EmpScore
);