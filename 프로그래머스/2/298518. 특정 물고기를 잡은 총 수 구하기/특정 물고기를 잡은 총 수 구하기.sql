-- 코드를 작성해주세요
SELECT COUNT(*) AS fish_count
FROM fish_info AS i
JOIN fish_name_info AS n ON i.fish_type = n.fish_type
WHERE n.fish_name IN ('BASS', 'SNAPPER');