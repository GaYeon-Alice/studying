-- Write your PostgreSQL query statement below
SELECT *
FROM users
WHERE email ~ '^\w+@\w+\.com$'
ORDER BY user_id;