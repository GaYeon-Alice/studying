# Write your MySQL query statement below
SELECT nd.id
FROM Weather AS td
JOIN Weather AS nd ON DATE_ADD(td.recordDate, INTERVAL +1 DAY) = nd.recordDate
WHERE td.temperature < nd.temperature;