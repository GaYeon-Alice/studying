-- 코드를 입력하세요
SELECT i.rest_id
     , i.rest_name
     , i.food_type
     , i.favorites
     , i.address
     , ROUND(AVG(r.review_score), 2) AS score
FROM rest_info AS i
JOIN rest_review AS r ON i.rest_id = r.rest_id
WHERE i.address LIKE '서울%'
GROUP BY i.rest_id
ORDER BY score DESC
       , i.favorites DESC;