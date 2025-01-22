-- 코드를 작성해주세요
SELECT COUNT(*) AS fish_count
     , MAX(length) AS max_length
     , fish_type
FROM fish_info
GROUP BY fish_type
HAVING AVG(IFNULL(length, 10)) >= 33  -- 10cm 이하의 물고기들은 10cm로 취급
ORDER BY fish_type;