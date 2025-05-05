-- Write your PostgreSQL query statement below
SELECT *
FROM users
WHERE REGEXP_LIKE(email, '^[a-zA-Z0-9_]+@[a-zA-Z]+.com$')
ORDER BY user_id;