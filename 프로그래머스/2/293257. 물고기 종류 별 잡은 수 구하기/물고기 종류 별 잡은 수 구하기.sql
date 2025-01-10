-- 코드를 작성해주세요
SELECT COUNT(*) AS fish_count
     , fni.fish_name
FROM fish_name_info AS fni
JOIN fish_info AS fi ON fni.fish_type = fi.fish_type
GROUP BY fni.fish_name
ORDER BY fish_count DESC;