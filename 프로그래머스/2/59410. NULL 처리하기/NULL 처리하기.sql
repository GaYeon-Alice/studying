-- 코드를 입력하세요
SELECT ANIMAL_TYPE
     , CASE
           WHEN NAME IS NULL THEN 'No name'  -- 이름이 없는 동물의 이름은 'No name'으로 표시
           ELSE NAME
       END AS NAME
     , SEX_UPON_INTAKE
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;