-- 코드를 입력하세요
SELECT I.ANIMAL_ID
     , I.ANIMAL_TYPE
     , I.NAME
FROM ANIMAL_INS AS I
JOIN ANIMAL_OUTS AS O ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE I.SEX_UPON_INTAKE LIKE 'Intact%'                                            -- 보호소에 들어올 당시에는 중성화되지 않았지만
  AND (O.SEX_UPON_OUTCOME LIKE 'Spayed%' OR O.SEX_UPON_OUTCOME LIKE 'Neutered%')  -- 보호소를 나갈 당시에는 중성화된 동물 조회