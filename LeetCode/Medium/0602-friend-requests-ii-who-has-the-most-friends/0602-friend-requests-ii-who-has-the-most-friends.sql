# Write your MySQL query statement below
WITH Relation AS (
    SELECT requester_id
         , accepter_id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id
         , requester_id
    FROM RequestAccepted
), FriendCounts AS (
    SELECT requester_id
         , COUNT(accepter_id) AS num
    FROM Relation
    GROUP BY requester_id
)
SELECT requester_id AS id
     , num
FROM FriendCounts
WHERE num = (SELECT MAX(num) FROM FriendCounts);