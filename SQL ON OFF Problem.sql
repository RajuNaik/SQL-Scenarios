create table event_status
(
event_time varchar(10),
status varchar(10)
);
insert into event_status 
values
('10:01','on'),('10:02','on'),('10:03','on'),('10:04','off'),('10:07','on'),('10:08','on'),('10:09','off')
,('10:11','on'),('10:12','off');


select * from event_status;


with cte1 as(
select event_time,status,lag(status,1,status) over(order by event_time) as prev_status from event_status
),cte2 as(
select *,case when status='on' and prev_status='off' then 1 else 0 end as flag  from cte1
),cte3 as (
select *,sum(flag) over(order by event_time rows BETWEEN unbounded preceding and 0 preceding ) as running_total from cte2
)
select min(event_time) as logintime,max(event_time) as logouttime,count(status)-1 as cnt from cte3 group BY
running_total