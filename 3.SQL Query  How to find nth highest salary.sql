--SQL Interview Question - How to find nth highest salary?
use sql_practice
drop table if exists Employee
CREATE TABLE dbo.Employee

(

 EmployeeID INT , 

 FirstName  varchar(50) ,

 LastName varchar(50) ,

 Phone varchar(20) ,

 Email varchar(50),

 Salary int

);



INSERT INTO dbo.Employee VALUES 

(1, 'Adam', 'Owens', '444345999' , 'adam@demo.com', 40000),

(2, 'Mark', 'Wilis', '245666921' , 'mark@demo.com',60000),

(3, 'Natasha', 'Leonard', '321888909' , 'natasha@demo.com',75000),

(4, 'Adam', 'hemster', '444345999' , 'adam@demo.com',60000),

(5, 'Riley', 'Jones', '123345959' , 'riley@demo.com',95645),

(6, 'Natasha', 'Lee', '321888909' , 'natasha@demo.com',23567);


-----Using Sub-Query/CTE, Windows Funcion

Select * from 

(Select *, Dense_rank() over (order by Salary desc) as Ranked from Employee) as A

where Ranked = 3

Select * from Employee

---------- finding the Second Highest Salary
Select * from Employee order by Salary


Select top 1* from(
Select top 2 * from Employee order by Salary desc) a order by a.Salary asc