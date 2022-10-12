create table transactions(
order_id int,
cust_id int,
order_date date,
amount int
);
delete from transactions;
insert into transactions values 
(1,1,'2020-01-15',150)
,(2,1,'2020-02-10',150)
,(3,2,'2020-01-16',150)
,(4,2,'2020-02-25',150)
,(5,3,'2020-01-10',150)
,(6,3,'2020-02-20',150)
,(7,4,'2020-01-20',150)
,(8,5,'2020-02-20',150)
;

select * from transactions;
--customer retention means, customer who purchased/placed order in subsequent months


with cte1 as(
select cust_id,min(order_date) prev_mon,max(order_date) next_mon from transactions group by cust_id
),cte2 as (
select  cust_id,prev_mon,next_mon,DATEDIFF(MONTH,prev_mon,next_mon) mon_diff from cte1
)
select DATEPART(month,next_mon) as month,count(cust_id) no_of_retained_customers from cte2 where mon_diff=0
group by DATEPART(month,next_mon) 