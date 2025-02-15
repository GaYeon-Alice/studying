-- 코드를 입력하세요
WITH available_cars AS (
    SELECT DISTINCT car_id
    FROM car_rental_company_rental_history
    WHERE car_id NOT IN (
        SELECT car_id
        FROM car_rental_company_rental_history
        WHERE start_date <= '2022-11-30'
          AND end_date >= '2022-11-01'
    )
), rental_fee AS (
    SELECT a.car_id
         , c.car_type
         , FLOOR(c.daily_fee * 30 * (1 - 0.01 * discount_rate)) AS fee
    FROM available_cars AS a
    JOIN car_rental_company_car AS c
      ON a.car_id = c.car_id
    JOIN car_rental_company_discount_plan AS d
      ON c.car_type = d.car_type
    WHERE c.car_type IN ('세단', 'SUV')
      AND d.duration_type = '30일 이상'
)
SELECT car_id
     , car_type
     , fee
FROM rental_fee
WHERE fee >= 500000 AND fee < 2000000
ORDER BY fee DESC, car_type, car_id DESC;