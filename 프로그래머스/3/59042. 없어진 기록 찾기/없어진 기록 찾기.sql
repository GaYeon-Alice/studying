-- 코드를 입력하세요
SELECT o.animal_id
     , o.name
FROM animal_outs AS o
LEFT JOIN animal_ins As i ON o.animal_id = i.animal_id
WHERE i.animal_id IS NULL  -- 보호소에 들어온 기록이 없는 동물
ORDER BY o.animal_id
       , o.name;