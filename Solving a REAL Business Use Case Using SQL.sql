create table tickets
(
ticket_id varchar(10),
create_date date,
resolved_date date
);
delete from tickets;
insert into tickets values
(1,'2022-08-01','2022-08-03')
,(2,'2022-08-01','2022-08-12')
,(3,'2022-08-01','2022-08-16');
create table holidays
(
holiday_date date
,reason varchar(100)
);
delete from holidays;
insert into holidays values
('2022-08-11','Rakhi'),('2022-08-15','Independence day');



select * from tickets;
select * from holidays;

with cte1 as(
select *,DATEDIFF(day,create_date,resolved_date) days_diff
,DATEPART(week,create_date) created_date_week
,DATEPART(week,resolved_date) resolved_date_date_week
,(DATEPART(week,resolved_date) - DATEPART(week,create_date)) * 2  weekends
from  tickets
),cte2 as(
select ticket_id,create_date,resolved_date,days_diff-weekends business_days,reason  from cte1
left outer JOIN holidays
on holiday_date between create_date and resolved_date
)select ticket_id,create_date,resolved_date,count(1) as holidays from cte2 group by ticket_id,create_date,resolved_date