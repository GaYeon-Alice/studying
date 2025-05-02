# Write your MySQL query statement below
WITH RECURSIVE hierachy AS (
    -- 최상위 관리자부터 시작
    SELECT employee_id
         , manager_id
         , employee_name
         , salary
         , 1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    -- 각 직원의 팀원들을 찾아가며 level 계산
    SELECT e.employee_id
         , e.manager_id
         , e.employee_name
         , e.salary
         , h.level + 1 AS level
    FROM employees AS e
    JOIN hierachy AS h
        ON e.manager_id = h.employee_id
), team_stats AS (
    -- 각 직원의 팀원 수와 예산 계산
    SELECT h.employee_id
         , h.employee_name
         , h.level
         , COUNT(sub.employee_id) AS team_size
         , COALESCE(SUM(sub.salary), 0) + h.salary AS budget
    FROM hierachy AS h
    LEFT JOIN LATERAL (
        -- 특정 직원 하의 모든 직원을 탐색
        WITH RECURSIVE subordinates AS (
            SELECT employee_id
                 , manager_id
                 , salary
            FROM employees AS e
            WHERE e.manager_id = h.employee_id

            UNION ALL
            
            SELECT e.employee_id
                 , e.manager_id
                 , e.salary
            FROM employees AS e
            JOIN subordinates AS s
                ON e.manager_id = s.employee_id
        )
        SELECT employee_id
             , salary
        FROM subordinates
    ) AS sub ON TRUE
    GROUP BY h.employee_id, h.employee_name, h.level, h.salary
)
SELECT *
FROM team_stats
ORDER BY level, budget DESC, employee_name;