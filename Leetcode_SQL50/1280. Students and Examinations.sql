Select a.student_id,a.student_name,a.subject_name, Count(e.subject_name) as attended_exams
from (Select * from students s,subjects sub) a
left join examinations e
on e.student_id=a.student_id and a.subject_name=e.subject_name
group by a.student_id,a.student_name,a.subject_name
order by a.student_id,a.subject_name
