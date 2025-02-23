-- 코드를 입력하세요
WITH filtered_cars AS (
    SELECT car_id
    FROM car_rental_company_rental_history
    WHERE start_date BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY car_id
    HAVING COUNT(*) >= 5
)
SELECT MONTH(r.start_date) AS month
     , r.car_id
     , COUNT(*) AS records
FROM car_rental_company_rental_history AS r
JOIN filtered_cars AS c
  ON r.car_id = c.car_id
WHERE r.start_date BETWEEN '2022-08-01' AND '2022-10-31'
GROUP BY MONTH(r.start_date), r.car_id
HAVING COUNT(*) > 0
ORDER BY month, r.car_id DESC;