# Write your MySQL query statement below
WITH Relation AS (  -- 모든 사용자 간 양방향 관계
    SELECT requester_id
         , accepter_id
    FROM RequestAccepted
    UNION
    SELECT accepter_id
         , requester_id
    FROM RequestAccepted
), FriendCounts AS (  -- 각 사용자별 친구 수
    SELECT requester_id
         , COUNT(accepter_id) AS num
    FROM Relation
    GROUP BY requester_id
)
SELECT requester_id AS id
     , num
FROM FriendCounts
WHERE num = (SELECT MAX(num) FROM FriendCounts);