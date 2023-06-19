Select round(sum(case when priority = 'Immediate' then 1 else 0 end)*100.00/Count(*),2) as immediate_percentage from
(Select a.customer_id, a.min_date,d.customer_pref_delivery_date, case when a.min_date=d.customer_pref_delivery_date then 'immediate' else 'scheduled' end as priority
from (Select customer_id,Min(order_date) min_date
from delivery
group by customer_id) a
inner join delivery d on a.customer_id=d.customer_id and a.min_date= d.order_date) b