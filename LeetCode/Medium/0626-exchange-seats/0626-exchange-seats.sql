# Write your MySQL query statement below
SELECT id
     , CASE
           WHEN id%2 = 0 THEN LAG(student) OVER(ORDER BY id)  -- 짝수 행이면 다음 값
           ELSE IFNULL(LEAD(student) OVER(ORDER BY id), student)  -- 홀수 행이면 이전 값 (단, 마지막 행이 홀수 행이면 해당 값은 그대로 출력)
       END AS student
FROM Seat
ORDER BY id;