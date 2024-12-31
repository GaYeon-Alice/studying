# Write your MySQL query statement below
WITH UnbannedUsers AS (
    SELECT *
    FROM Trips AS t
    WHERE client_id IN (SELECT users_id
                        FROM Users
                        WHERE banned = 'No' AND role = 'client')
      AND driver_id IN (SELECT users_id
                        FROM Users
                        WHERE banned = 'No' AND role = 'driver')
)
SELECT request_at AS Day
     , ROUND(SUM(CASE WHEN status LIKE 'cancelled%' THEN 1 ELSE 0 END) / COUNT(*), 2) AS 'Cancellation Rate'
FROM UnbannedUsers
GROUP BY request_at;