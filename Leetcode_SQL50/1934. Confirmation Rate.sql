Select s.user_id,round(avg(case when c.action ='Confirmed' then 1 when c.action is null then 0.00 else 0 end),2) as confirmation_rate
from Signups s
left join Confirmations c
on s.user_id=c.user_id
group by s. user_id
