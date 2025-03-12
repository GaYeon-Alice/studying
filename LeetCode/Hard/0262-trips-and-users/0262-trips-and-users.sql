-- Write your PostgreSQL query statement below
WITH UnbannedUsers AS (
    SELECT users_id
    FROM users
    WHERE banned = 'No'
)
SELECT request_at AS day
     , ROUND(COUNT(CASE WHEN status LIKE 'cancelled%' THEN id END) * 1.0 / COUNT(*), 2) AS "cancellation rate"
FROM trips
WHERE client_id IN (
    SELECT users_id
    FROM UnbannedUsers
) AND driver_id IN (
    SELECT users_id
    FROM UnbannedUsers
) AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY day
HAVING COUNT(*) > 0