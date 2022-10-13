create table players_location
(
name varchar(20),
city varchar(20)
);
delete from players_location;
insert into players_location
values ('Sachin','Mumbai'),('Virat','Delhi') , ('Rahul','Bangalore'),('Rohit','Mumbai'),('Mayank','Bangalore');

select * from players_location;


with cte as(
select city,case when city='Bangalore' then name end as 'Bangalore',
case when city='Mumbai' then name end as 'Mumbai',
case when city='Delhi' then name end as 'Delhi',
row_number() over(partition by city order by name asc) as rn
 from players_location
)
select max(Bangalore) Bangalore,max(Mumbai) Mumbai, max(Delhi) Delhi from cte group by rn 

