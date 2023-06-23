Select contest_id,round((Count(r.user_id)*1.00/(select count(*) from users))*100,2) as percentage
From Register r
group by contest_id
order by percentage desc,contest_id