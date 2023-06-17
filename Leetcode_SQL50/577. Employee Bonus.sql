Select e.Name,b.bonus
from Employee e
left join Bonus b
on b.empid=e.empid
where b.bonus < 1000 or b.bonus is null