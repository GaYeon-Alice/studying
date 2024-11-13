# Write your MySQL query statement below
SELECT *
FROM Users
-- 아이디가 영문자로 시작하고 영어 대소문자, 숫자, _, ., -만 포함하며
-- 도메인은 @leetcode.com으로 끝나는 이메일만 조회
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com$';  