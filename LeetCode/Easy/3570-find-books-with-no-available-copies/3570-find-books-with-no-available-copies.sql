# Write your MySQL query statement below
WITH borrower_counts AS (
    SELECT book_id
         , COUNT(record_id) AS current_borrowers
    FROM borrowing_records
    WHERE return_date IS NULL
    GROUP BY book_id
)
SELECT lb.book_id
     , lb.title
     , lb.author
     , lb.genre
     , lb.publication_year
     , bc.current_borrowers
FROM library_books AS lb
JOIN borrower_counts AS bc
    ON lb.book_id = bc.book_id
WHERE lb.total_copies = bc.current_borrowers
ORDER BY bc.current_borrowers DESC, lb.title;