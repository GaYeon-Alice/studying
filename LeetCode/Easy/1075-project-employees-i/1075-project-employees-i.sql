-- Write your PostgreSQL query statement below
SELECT p.project_id
     , ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project AS p
     JOIN Employee AS e USING (employee_id)
GROUP BY p.project_id