-- Write your PostgreSQL query statement below
(
    SELECT u.name AS results
    FROM Users AS u
         JOIN MovieRating AS r USING (user_id)
    GROUP BY u.name
    ORDER BY COUNT(DISTINCT r.movie_id) DESC, u.name
    LIMIT 1
)
UNION ALL
(
    SELECT m.title AS results
    FROM Movies AS m
         JOIN MovieRating AS r USING (movie_id)
    WHERE TO_CHAR(created_at, 'YYYY-MM') = '2020-02'
    GROUP BY m.title
    ORDER BY AVG(rating) DESC, m.title
    LIMIT 1
)