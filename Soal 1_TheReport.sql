WITH student_grades AS (
    SELECT 
        s.name,
        g.grade,
        s.marks
    from students s
    join grades g
        on s.marks between g.min_mark AND g.max_mark
)

select
    CASE WHEN grade < 8  then 'NULL'
    ELSE name
    end as name,
    grade,
    marks
from student_grades
order by grade desc,
CASE WHEN grade >= 8 THEN name END ASC,
CASE WHEN grade < 8 THEN marks END ASC;
