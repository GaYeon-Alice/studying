# Write your MySQL query statement below
WITH parsedip AS (
    SELECT *
         , SUBSTRING_INDEX(ip, '.', 1) AS octet1
         , SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1) AS octet2
         , SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), '.', -1) AS octet3
         , SUBSTRING_INDEX(ip, '.', -1) AS octet4
    FROM logs
    WHERE LENGTH(ip) - LENGTH(REPLACE(ip, '.', '')) = 3  -- 옥텟이 4개인 IP 주소
), validip AS (
    SELECT *
    FROM parsedip
    WHERE (octet1 <= 255 AND octet2 <= 255 AND octet3 <= 255 AND octet4 <= 255)  -- 각 옥텟이 255 이하
      AND (octet1 NOT LIKE '0%' AND octet2 NOT LIKE '0%' AND octet3 NOT LIKE '0%' AND octet4 NOT LIKE '0%')  -- 각 옥텟이 0으로 시작하지 않음
)
SELECT ip
     , COUNT(*) AS invalid_count
FROM logs
WHERE ip NOT IN (
    SELECT ip
    FROM validip
)
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;