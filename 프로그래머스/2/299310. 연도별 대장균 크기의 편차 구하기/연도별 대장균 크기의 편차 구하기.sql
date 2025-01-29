-- 코드를 작성해주세요
WITH yearly_largest_colony AS (
    SELECT YEAR(differentiation_date) AS year
         , MAX(size_of_colony) AS largest_colony
    FROM ecoli_data
    GROUP BY year
)
SELECT YEAR(differentiation_date) AS year
     , m.largest_colony - e.size_of_colony AS year_dev
     , e.id
FROM ecoli_data AS e
     JOIN yearly_largest_colony AS m ON YEAR(e.differentiation_date) = m.year
ORDER BY year
       , year_dev;