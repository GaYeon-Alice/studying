-- 코드를 작성해주세요
SELECT c2.id
FROM ecoli_data AS p
     JOIN ecoli_data AS c ON p.id = c.parent_id
     JOIN ecoli_data AS c2 ON c.id = c2.parent_id
WHERE p.parent_id IS NULL
ORDER BY c2.id;