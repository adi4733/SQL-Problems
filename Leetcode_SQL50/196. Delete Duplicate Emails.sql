Delete X from (select row_number() over ( partition by email order by id asc) as row_num,* from person) as x
where x.row_num > 1