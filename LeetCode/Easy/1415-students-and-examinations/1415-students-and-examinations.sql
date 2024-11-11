# Write your MySQL query statement below
SELECT stu.student_id
     , stu.student_name
     , sub.subject_name
     , COUNT(e.subject_name) AS attended_exams  -- 각 학생의 과목별 응시 횟수 계산
FROM Students AS stu
CROSS JOIN Subjects AS sub  -- 학생마다 모든 과목이 표시되도록 출력
LEFT JOIN Examinations AS e  -- 학생이 특정 과목 시험에 응시한 경우에만 결합
    ON stu.student_id = e.student_id
    AND sub.subject_name = e.subject_name
GROUP BY stu.student_id
       , stu.student_name
       , sub.subject_name
ORDER BY stu.student_id
       , sub.subject_name;