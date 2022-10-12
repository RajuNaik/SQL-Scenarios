create table amazon_users
(
user_id integer,
name varchar(20),
join_date date
);
insert into amazon_users
values (1, 'Jon', CAST('2-14-20' AS date)), 
(2, 'Jane', CAST('2-14-20' AS date)), 
(3, 'Jill', CAST('2-15-20' AS date)), 
(4, 'Josh', CAST('2-15-20' AS date)), 
(5, 'Jean', CAST('2-16-20' AS date)), 
(6, 'Justin', CAST('2-17-20' AS date)),
(7, 'Jeremy', CAST('2-18-20' AS date));

create table events
(
user_id integer,
type varchar(10),
access_date date
);

insert into events values
(1, 'Pay', CAST('3-1-20' AS date)), 
(2, 'Music', CAST('3-2-20' AS date)), 
(2, 'P', CAST('3-12-20' AS date)),
(3, 'Music', CAST('3-15-20' AS date)), 
(4, 'Music', CAST('3-15-20' AS date)), 
(1, 'P', CAST('3-16-20' AS date)), 
(3, 'P', CAST('3-22-20' AS date));


select * from amazon_users;
select * from events;


with cte1 as(
select e.*,u.join_date from events e,amazon_users u where e.user_id=u.user_id --order by user_id
),cte2 as(
select user_id,min(type) amazon_music,max(type) prime,max(access_date) prime_date,max(join_date) join_date from cte1
group by user_id
),
 x as(select count(*) no_of_total_users,1 as a from cte2 where amazon_music='music'),
y as(select count(user_id) no_of_prime_users,1 as b from cte2 where prime='P' and DATEDIFF(day,join_date,prime_date)<30)
select no_of_total_users,no_of_prime_users,no_of_prime_users*1.0 / no_of_total_users as ratio  from y join x on x.a=y.b


