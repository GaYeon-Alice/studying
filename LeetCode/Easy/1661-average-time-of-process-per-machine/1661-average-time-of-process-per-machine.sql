# Write your MySQL query statement below
SELECT machine_id
     , ROUND(SUM(IF(activity_type = 'start', -timestamp, timestamp))  -- 'start' 타임스탬프를 음수로 변환하여 'end' 타임스탬프와의 차이 계산
             / COUNT(DISTINCT process_id), 3) AS processing_time
FROM Activity
GROUP BY machine_id;