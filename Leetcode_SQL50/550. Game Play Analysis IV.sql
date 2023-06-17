Select round(count(*)*1.00/(select count(distinct player_id) from activity),2) as fraction 
from
	(Select player_id,event_date,
			lead(event_date,1) over (partition by player_id order by event_date) as next_day,
			row_number() over(partition by player_id order by event_date) as rn
	from Activity) a
where rn=1 and dateadd(day,1,event_date) = next_day