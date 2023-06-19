
CREATE TABLE dbo.Employee1

(

 EmployeeID INT , 

 FirstName  varchar(50) ,

 LastName varchar(50) ,

 ManagerId int


);



INSERT INTO dbo.Employee1 VALUES 

(1, 'Adam', 'Owens',3 ),

(2, 'Mark', 'Wilis',Null ),

(3, 'Natasha', 'Leonard',2 ),

(4, 'Adam', 'hemster',5),

(5, 'Riley', 'Jones',2),

(6, 'Natasha', 'Lee',5 );

Select * from Employee1

--Select * from Employee1 e1
--inner join Employee1 as m1 on e1.EmployeeId = m1.ManagerId
Select e1.EmployeeID, e1.FirstName,m2.EmployeeID as MID,m2.FirstName as Manager from Employee1 e1
join Employee1 as m2 on m2.EmployeeId = e1.ManagerId order by e1.EmployeeID asc
