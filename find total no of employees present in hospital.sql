create table hospital ( emp_id int
, action varchar(10)
, time datetime);

insert into hospital values ('1', 'in', '2019-12-22 09:00:00');
insert into hospital values ('1', 'out', '2019-12-22 09:15:00');
insert into hospital values ('2', 'in', '2019-12-22 09:00:00');
insert into hospital values ('2', 'out', '2019-12-22 09:15:00');
insert into hospital values ('2', 'in', '2019-12-22 09:30:00');
insert into hospital values ('3', 'out', '2019-12-22 09:00:00');
insert into hospital values ('3', 'in', '2019-12-22 09:15:00');
insert into hospital values ('3', 'out', '2019-12-22 09:30:00');
insert into hospital values ('3', 'in', '2019-12-22 09:45:00');
insert into hospital values ('4', 'in', '2019-12-22 09:45:00');
insert into hospital values ('5', 'out', '2019-12-22 09:40:00');

select * from hospital;

--sql to find total no of employees present in hospital

with cte1 as (
select emp_id,case when action='in' then time end as in_time ,
case when action='out' then time end as out_time
from hospital
),cte2 as
(select emp_id,max(in_time) as in_time,max(out_time) as out_time from cte1 group by emp_id)
select * from cte2 where out_time is null or in_time>out_time

WITH CTE AS (
SELECT *,
  RANK() OVER (PARTITION BY emp_id ORDER BY time DESC) rnk
FROM hospital 
)
SELECT *
FROM CTE
WHERE rnk=1
AND action='in'