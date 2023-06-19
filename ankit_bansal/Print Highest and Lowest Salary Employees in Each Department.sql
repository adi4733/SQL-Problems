sELECT * FROM employee;
WITH cte1 AS
(SELECT dept_id,MIN(salary) as min_sal,max(salary) as max_sal from employee group by dept_id)
select e.dept_id,
max(case when e.salary=min_sal then e.emp_name end) as min_sal_emp,
max(case when e.salary=max_sal then e.emp_name end) as max_sal_emp
from employee e
inner join cte1 on e.dept_id=cte1.dept_id
group by e.dept_id
