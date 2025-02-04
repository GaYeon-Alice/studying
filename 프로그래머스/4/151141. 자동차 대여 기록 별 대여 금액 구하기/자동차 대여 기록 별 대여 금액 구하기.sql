-- 코드를 입력하세요
WITH RENTAL_INFO AS (
    SELECT h.history_id
         , c.daily_fee
         , c.car_type
         , DATEDIFF(h.end_date, h.start_date) + 1 AS rental_days
    FROM CAR_RENTAL_COMPANY_CAR AS c
    JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY AS h ON c.car_id = h.car_id
    WHERE c.car_type = '트럭'
)
SELECT r.history_id
     , FLOOR(r.daily_fee * (1 - 0.01 * COALESCE(d.discount_rate, 0)) * r.rental_days) AS fee
FROM RENTAL_INFO AS r
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS d
    ON r.car_type = d.car_type
    AND (
        (d.duration_type = '7일 이상' AND r.rental_days BETWEEN 7 AND 29)
        OR (d.duration_type = '30일 이상' AND r.rental_days BETWEEN 30 AND 89)
        OR (d.duration_type = '90일 이상' AND r.rental_days >= 90)
    ) 
ORDER BY fee DESC, r.history_id DESC;