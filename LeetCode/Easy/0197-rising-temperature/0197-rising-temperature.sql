# Write your MySQL query statement below
SELECT nw.id
FROM Weather AS tw
JOIN Weather AS nw ON DATE_ADD(tw.recordDate, INTERVAL +1 DAY) = nw.recordDate
WHERE tw.temperature < nw.temperature;