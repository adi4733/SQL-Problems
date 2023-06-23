Select a.machine_id ,round(avg(b.timestamp -a.timestamp),3)  as processing_time from
(Select *
from Activity
where activity_type ='start') a
inner join
(Select *
from Activity
where activity_type ='end') b on b.machine_id=a.machine_id and b.process_id=a.process_id
group by a.machine_id