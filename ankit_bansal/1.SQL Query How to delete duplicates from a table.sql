--SQL Query - How to delete duplicates from a table?

Create Database sql_practice
go
drop table Employee
CREATE TABLE dbo.Employee

(

 EmployeeID INT , 

 FirstName  varchar(50) ,

 LastName varchar(50) ,

 Phone varchar(20) ,

 Email varchar(50)

);



INSERT INTO dbo.Employee VALUES 

(1, 'Adam', 'Owens', '444345999' , 'adam@demo.com'),

(2, 'Mark', 'Wilis', '245666921' , 'mark@demo.com'),

(3, 'Natasha', 'Lee', '321888909' , 'natasha@demo.com'),

(4, 'Adam', 'Owens', '444345999' , 'adam@demo.com'),

(5, 'Riley', 'Jones', '123345959' , 'riley@demo.com'),

(6, 'Natasha', 'Lee', '321888909' , 'natasha@demo.com');

-------------------------------------------------------------------------------------------------------------------------
--Solution 1------
use sql_practice
Delete from Employee
where EmployeeID not in(
Select max(employeeid) from Employee group by FirstName,LastName)
Select * From Employee

--Output is EmpID 2-4-5-6 (Deletes the first encountered Duplicates)

--------Solution 2--------
drop table Employee
With Emp_cte as(
Select *, RANK() over(partition by FirstName,Lastname order by EmployeeID) as Ranked from Employee
)
Delete from Emp_cte
where Ranked >1

Select * From Employee

--Output is EmpID 1-2-3-5 (Deletes the Second encountered Duplicates)

