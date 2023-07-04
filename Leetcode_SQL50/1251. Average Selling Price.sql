Select p.product_id,round(sum(p.price*U.units)*1.00/sum(U.units),2) as average_price from
prices p
inner join unitssold u
on (p.product_id= u.product_id) and (purchase_date between p.start_date and p.end_date)
group by p.product_id