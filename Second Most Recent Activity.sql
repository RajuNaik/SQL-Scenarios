create table UserActivity
(
username      varchar(20) ,
activity      varchar(20),
startDate     Date   ,
endDate      Date
);

insert into UserActivity values 
('Alice','Travel','2020-02-12','2020-02-20')
,('Alice','Dancing','2020-02-21','2020-02-23')
,('Alice','Travel','2020-02-24','2020-02-28')
,('Bob','Travel','2020-02-11','2020-02-18');

select * from UserActivity;

--second most recent activity

with cte1 as(
select username,activity,startdate,enddate,rank() over(partition by username order by enddate desc )rnk
from UserActivity
)
select username,activity,startdate,enddate from cte1 where rnk=2
union all
select username,min(activity) activity,min(startdate) startdate,min(enddate) enddate  from cte1 
group by username having count(*)=1