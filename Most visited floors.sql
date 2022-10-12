create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),
('A','Bangalore','A1@gmail.com',1,'CPU'),
('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),
('B','Bangalore','B1@gmail.com',2,'DESKTOP'),
('B','Bangalore','B2@gmail.com',1,'MONITOR')

select * from entries;


with cte2 as(
select name,count(*) as total_visits from entries GROUP by name
),
cte1 as(
select name,floor,count(1) as no_of_floor_visit,rank() over(partition by name order by count(1) desc) as rnk from entries
GROUP by name,floor
),
cte3 as (select name,STRING_AGG(resources,',') as resources_used from entries group by name)
select cte1.name,cte1.floor as most_visted_floor,cte2.total_visits,cte3.resources_used from cte1 as cte1,cte2 as cte2,cte3 as cte3
where cte1.name=cte2.name and cte1.rnk=1 and cte3.name=cte1.name

--select name,floor as most_visited_floor from cte1 where cte1.rnk=1 

