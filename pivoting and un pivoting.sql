create table emp_compensation (
emp_id int,
salary_component_type varchar(20),
val int
);
insert into emp_compensation
values (1,'salary',10000),(1,'bonus',5000),(1,'hike_percent',10)
, (2,'salary',15000),(2,'bonus',7000),(2,'hike_percent',8)
, (3,'salary',12000),(3,'bonus',6000),(3,'hike_percent',7);
select * from emp_compensation;


select * from emp_compensation;

--pivoting and un pivoting

--pivoting
with cte1 as(
select emp_id,
case when salary_component_type='salary' then val end as 'salary',
case when salary_component_type='bonus' then val end as 'bonus',
case when salary_component_type='hike_percent' then val end as 'hike_percent'
from emp_compensation
)
select emp_id,max(salary) salary,max(bonus) bonus,max(hike_percent) hike_percent 
into new_table
from cte1 group by emp_id

/*select * from new_table
insert into new_table select * from new_table

drop table new_table*/

--un pivoting

select * from new_table;

select emp_id,'salary' as salary_component_type,salary from new_table
union all
select emp_id,'bonus' as salary_component_type,bonus from new_table
union all
select emp_id,'hike_percent' as salary_component_type,hike_percent from new_table
order by emp_id