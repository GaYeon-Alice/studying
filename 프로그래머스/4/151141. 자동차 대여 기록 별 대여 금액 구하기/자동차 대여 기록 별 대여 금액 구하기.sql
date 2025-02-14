-- 코드를 입력하세요
WITH rental_info AS (
    SELECT r.history_id
         , c.daily_fee
         , DATEDIFF(r.end_date, r.start_date) + 1 AS rental_days
    FROM car_rental_company_rental_history AS r
    JOIN car_rental_company_car AS c
      ON r.car_id = c.car_id
    WHERE c.car_type = '트럭'
), discount_info AS (
    SELECT duration_type
         , discount_rate
    FROM car_rental_company_discount_plan
    WHERE car_type = '트럭'
)
SELECT i.history_id,
       FLOOR(i.daily_fee * i.rental_days * (1 - 0.01 * COALESCE(d.discount_rate, 0))) AS fee
FROM rental_info AS i
LEFT JOIN discount_info AS d
  ON (
         (d.duration_type = '7일 이상' AND i.rental_days BETWEEN 7 AND 29)
      OR (d.duration_type = '30일 이상' AND i.rental_days BETWEEN 30 AND 89)
      OR (d.duration_type = '90일 이상' AND i.rental_days >= 90)
)
ORDER BY fee DESC, i.history_id DESC;