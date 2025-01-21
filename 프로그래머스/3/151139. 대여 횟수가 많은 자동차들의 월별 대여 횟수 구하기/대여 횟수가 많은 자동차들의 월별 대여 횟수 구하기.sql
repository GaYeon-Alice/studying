-- 코드를 입력하세요
WITH FilteredCars AS (
    SELECT car_id
    FROM car_rental_company_rental_history
    WHERE start_date BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY car_id
    HAVING COUNT(*) >= 5
)
SELECT MONTH(start_date) AS month
     , car_id
     , COUNT(*) AS records
FROM car_rental_company_rental_history
WHERE start_date BETWEEN '2022-08-01' AND '2022-10-31'
  AND car_id IN (SELECT car_id FROM FilteredCars)
GROUP BY month
       , car_id
ORDER BY month
       , car_id DESC;