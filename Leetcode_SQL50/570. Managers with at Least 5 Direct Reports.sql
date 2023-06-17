Select name from
(Select e1.managerId ,e2.name as name from Employee e1
inner join Employee e2
on e1.managerId=e2.id) a
Group by name 
having count(a.managerId)>4
