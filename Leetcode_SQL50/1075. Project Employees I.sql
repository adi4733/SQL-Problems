Select p.project_id,round(sum(e.experience_years)*1.00/count(p.project_id),2) as average_years
from project p
inner join Employee e
on p.employee_id=e.employee_id
group by p.project_id