Select Department.Name as Department, A.name as Employee,A.salary as salary from
(Select *,dense_rank() over (partition by departmentId order by salary desc) as Sal_ord from Employee) as A
join Department on department.id=A.departmentId
where Sal_ord in (1,2,3) 