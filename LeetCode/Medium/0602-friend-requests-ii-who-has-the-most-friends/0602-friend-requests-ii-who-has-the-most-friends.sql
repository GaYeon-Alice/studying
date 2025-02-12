-- Write your PostgreSQL query statement below
WITH Friends AS (
    SELECT requester_id
         , accepter_id
    FROM RequestAccepted
    UNION
    SELECT accepter_id
         , requester_id
    FROM RequestAccepted
), Counts AS (
    SELECT requester_id AS id
         , COUNT(*) AS num
    FROM Friends
    GROUP BY id
)
SELECT id
     , num
FROM Counts
WHERE num = (SELECT MAX(num) FROM Counts)
