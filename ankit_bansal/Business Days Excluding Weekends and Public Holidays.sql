create table tickets
(
ticket_id varchar(10),
create_date date,
resolved_date date
);
delete from tickets;
insert into tickets values
(1,'2022-08-01','2022-08-03')
,(2,'2022-08-01','2022-08-12')
,(3,'2022-08-01','2022-08-16');
create table holidays
(
holiday_date date
,reason varchar(100)
);

delete from holidays;
insert into holidays values
('2022-08-11','Rakhi'),('2022-08-15','Independence day');


Select ticket_id,create_date,resolved_date,datediff(day,create_date,resolved_date) as act_days ,
datediff(day,create_date,resolved_date)-2*datediff(week,create_date,resolved_date) as days_Without_weekend,
count(holiday_date) as holiday_days,(datediff(day,create_date,resolved_date)-2*datediff(week,create_date,resolved_date))-count(holiday_date) business_days
from tickets
left join holidays on holiday_date between create_date and resolved_date
group by ticket_id,create_date,resolved_date

select * from holidays
insert into holidays values ('2022-08-14','pooja')

Select datepart(WEEKDAY,'2022-08-1')

Select * from tickets
select * from holidays

Select 
	ticket_id,create_date,resolved_date,
	DATEDIFF(day,create_date,resolved_date) as no_of_days,
	datediff(week,create_date,resolved_date) No_of_weekends,
	DATEDIFF(day,create_date,resolved_date)-2*datediff(week,create_date,resolved_date) as temp_bd
	--case when datepart(weekday,holiday_date) <> 1 and datepart(weekday,holiday_date) <> 7 then count(holiday_date) else null end as holiday_weekend
from tickets
left join holidays
on holiday_date between create_date and resolved_date
--business days excluding holidays on weekends
with cte as (
select *
from tickets left join holidays on (holiday_date between create_date and resolved_date) and 
(datename(weekday,holiday_date) <> 'Saturday' and datename(weekday,holiday_date) <> 'Sunday')
)
select ticket_id,create_date,resolved_date,
datediff(day,create_date,resolved_date) - 2*(datepart(week,resolved_date)-datepart(week,create_date)) - count(holiday_date) actual_biz_days
from cte
group by ticket_id,create_date,resolved_date
