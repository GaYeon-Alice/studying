-- 코드를 입력하세요
SELECT fh.flavor
FROM first_half AS fh
JOIN july as j
  ON fh.flavor = j.flavor
GROUP BY fh.flavor
ORDER BY fh.total_order + SUM(j.total_order) DESC
LIMIT 3;