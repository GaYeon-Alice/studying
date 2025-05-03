-- Write your PostgreSQL query statement below
WITH scorehistory AS (
    SELECT student_id
         , subject
         , score
         , exam_date
         , ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date) AS first_exam
         , ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date DESC) AS latest_exam
    FROM scores
    WHERE (student_id, subject) IN (
        SELECT student_id
             , subject
        FROM scores
        GROUP BY student_id, subject
        HAVING COUNT(DISTINCT exam_date) >= 2
    )
)
SELECT student_id
     , subject
     , MAX(score) FILTER (WHERE first_exam = 1) AS first_score
     , MAX(score) FILTER (WHERE latest_exam = 1) AS latest_score
FROM scorehistory
GROUP BY student_id, subject
HAVING MAX(score) FILTER (WHERE first_exam = 1) < MAX(score) FILTER (WHERE latest_exam = 1)
ORDER BY student_id, subject;