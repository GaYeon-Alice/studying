-- 코드를 작성해주세요
SELECT E.EMP_NO
     , E.EMP_NAME
     , CASE
           WHEN AVG(G.SCORE) >= 96 THEN 'S'
           WHEN AVG(G.SCORE) >= 90 THEN 'A'
           WHEN AVG(G.SCORE) >= 80 THEN 'B'
           ELSE 'C'
       END AS GRADE
     , CASE
           WHEN AVG(G.SCORE) >= 96 THEN 0.2 * SAL
           WHEN AVG(G.SCORE) >= 90 THEN 0.15 * SAL
           WHEN AVG(G.SCORE) >= 80 THEN 0.1 * SAL
           ELSE 0
       END AS BONUS
FROM HR_EMPLOYEES AS E
JOIN HR_GRADE AS G
ON E.EMP_NO = G.EMP_NO
GROUP BY E.EMP_NO
ORDER BY E.EMP_NO;