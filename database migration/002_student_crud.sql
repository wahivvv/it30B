SELECT * FROM students;

SELECT * FROM students
    ORDER BY student_id ASC;

SELECT * FROM students
    ORDER BY student_id DESC;

SELECT * FROM students
    ORDER BY student_last_name ASC;

SELECT * FROM students
    ORDER BY student_last_name DESC;

SELECT * FROM students
    ORDER BY student_first_name ASC;

SELECT * FROM students
    ORDER BY student_first_name DESC;

SELECT student_first_name, 
    student_last_name
FROM students
ORDER BY student_first_name ASC;

SELECT student_first_name, 
    student_last_name
FROM students
ORDER BY student_first_name ASC
LIMIT 1;


SELECT student_first_name, 
    student_last_name
FROM students
WHERE student_id = 1
LIMIT 1;

UPDATE students
SET student_first_name='RENE',
    student_last_name='BATERBONIA'
WHERE student_id = 1;







