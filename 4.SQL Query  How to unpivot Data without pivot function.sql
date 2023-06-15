CREATE TABLE dbo.Employee3

(

 Name Varchar(50) , 

 Value  varchar(50) ,

 Id int


);



INSERT INTO dbo.Employee3 VALUES 

('Name', 'Adam', 1 ),

('Gender', 'Male', 1 ),

('Salary', '50000', 1 )
;
select * from Employee3
Select Id,
max(case when Name = 'Name' then Value else '' End )as Name,
max(case when Name = 'Gender' then Value else '' End) as Gender,
max(case when Name = 'Salary' then Value else '' End) as Salary
 from Employee3 group  by Id

