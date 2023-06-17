Select w1.id  as Id from Weather w1,weather w2
where w1.recordDate = dateadd(day,1,w2.recordDate) and w1.temperature > w2.temperature