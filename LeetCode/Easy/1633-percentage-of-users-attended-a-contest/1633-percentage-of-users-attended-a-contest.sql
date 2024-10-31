# Write your MySQL query statement below
SELECT r.contest_id
     , ROUND(COUNT(r.contest_id) / (SELECT COUNT(user_id) FROM Users) * 100, 2) AS percentage  -- 각 대회별 참여자 수는 contest_id의 수와 같음
FROM Register AS r
LEFT JOIN Users AS u ON r.user_id = u.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC
       , r.contest_id;