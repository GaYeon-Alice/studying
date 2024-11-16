-- 코드를 작성해주세요
SELECT C2.ID
FROM ECOLI_DATA AS P  -- P.PARENT_ID가 NULL이면 P.ID가 1세대 대장균임을 의미
LEFT JOIN ECOLI_DATA AS C1 ON P.ID = C1.PARENT_ID  -- P.PARENT_ID가 NULL이면 C1.ID가 2세대 대장균임을 의미
LEFT JOIN ECOLI_DATA AS C2 ON C1.ID = C2.PARENT_ID  -- P.PARENT_ID가 NULL이고 C2.ID가 존재하면 C2.ID가 3세대 대장균임을 의미
WHERE P.PARENT_ID IS NULL
  AND C2.ID IS NOT NULL
ORDER BY C2.ID;