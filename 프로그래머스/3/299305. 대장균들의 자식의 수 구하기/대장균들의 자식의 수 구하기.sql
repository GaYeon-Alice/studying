-- 코드를 작성해주세요
SELECT p.id
     , IFNULL(COUNT(c.id), 0) AS child_count
FROM ecoli_data AS p
LEFT JOIN ecoli_data AS c ON p.id = c.parent_id
GROUP BY p.id
ORDER BY p.id;