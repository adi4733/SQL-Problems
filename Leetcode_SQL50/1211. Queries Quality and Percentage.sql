Select query_name,round(avg(q1),2) as quality,round(sum(counta)*1.00/count(query_name)*100,2) as poor_query_percentage from
(Select query_name,(rating*1.00/position) as q1,
case when rating < 3 then 1 else 0 end as counta from Queries) a
group by query_name