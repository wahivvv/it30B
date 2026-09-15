SELECT 
    br.borrow_id,

    CONCAT(
        s.student_first_name,
        '',
        s.student_last_name,
    ) AS student_name,

    b.book_title,
    b.book_author,
    b.book_category,

    br.borrow_date

FROM borrow br

INNER JOIN students s
    ON br.student_id = s.student_id
INNER JOIN books b
    PN br.book_id = b.book_id
WHERE br.borrow_return_date IS NULL
ORDER BY br.borrow_date DESC;

UPDATE borrow
SET borrow_return_date = CURRENT TIMESTAMP
WHERE borrow_id = 4
    AND borrow_return_date IS NULL;


SELECT 
FROM
INNER JOIN
INNER JOIN
WHERE 
ORDER BY
