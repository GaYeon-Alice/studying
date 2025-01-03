# Write your MySQL query statement below
SELECT DISTINCT p.id
     , CASE
           WHEN p.p_id IS NULL THEN 'Root'  -- 부모 노드가 없으면 루트 노드
           WHEN c.id IS NULL THEN 'Leaf'  -- 자식 노드가 없으면 리프 노드
           ELSE 'Inner'  -- 부모 노드와 자식 노드가 모두 있으면 내부 노드
       END AS type
FROM Tree AS p
LEFT JOIN Tree AS c ON p.id = c.p_id;