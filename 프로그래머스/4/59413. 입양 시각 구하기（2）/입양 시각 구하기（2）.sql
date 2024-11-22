-- 코드를 입력하세요
-- 초기 시간 값을 -1로 설정
SET @HOUR = -1;

-- 각 시간대별 입양 건수 계산
SELECT (@HOUR := @HOUR + 1) AS HOUR  -- 시간 값을 1씩 증가시켜 0시부터 23시까지 반복
     , (SELECT COUNT(HOUR(DATETIME))  -- 해당 시간대에 일어난 입양 건수 조회
        FROM ANIMAL_OUTS
        WHERE HOUR(DATETIME) = @HOUR) AS COUNT
FROM ANIMAL_OUTS
WHERE @HOUR < 23;