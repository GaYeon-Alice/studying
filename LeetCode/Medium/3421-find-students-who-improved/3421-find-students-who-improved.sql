# Write your MySQL query statement below
WITH compare_score AS (
    SELECT student_id
         , subject
         , score
         , exam_date
         , ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date) AS rn1  -- 첫 시험
         , ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date DESC) AS rn2  -- 마지막 시험
    FROM scores AS s
    WHERE EXISTS (
        SELECT 1
        FROM scores AS s2
        WHERE s2.student_id = s.student_id
          AND s2.subject = s.subject
        GROUP BY s2.student_id, s2.subject
        HAVING COUNT(DISTINCT s2.exam_date) >= 2  -- 동일한 과목 시험을 두 번 이상 본 학생만 추출
    )
)
SELECT student_id
     , subject
     , MAX(CASE WHEN rn1 = 1 THEN score END) AS first_score
     , MAX(CASE WHEN rn2 = 1 THEN score END) AS latest_score
FROM compare_score
GROUP BY student_id, subject
HAVING first_score < latest_score  -- 점수가 오른 학생
ORDER BY student_id, subject;