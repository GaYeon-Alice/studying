# Write your MySQL query statement below
DELETE p1
FROM Person AS p1, Person AS p2
WHERE p1.email = p2.email
  AND p1.id > p2.id;  -- 이메일이 중복되는 경우, id 값이 작은 행이 남아 있어야 하므로 id 값이 더 큰 행을 삭제