create table products
(
product_id varchar(20) ,
cost int
);
insert into products values ('P1',200),('P2',300),('P3',500),('P4',800);

create table customer_budget
(
customer_id int,
budget int
);

insert into customer_budget values (100,400),(200,800),(300,1500);

select * from products;
select * from customer_budget;

with cte1 as(
select product_id,cost, sum(cost) over(order by product_id asc,cost asc rows between unbounded preceding and 0 preceding)as running_total
from products
),cte2 as(
select * from cte1 join customer_budget on cost<budget 
where budget>=running_total --order by customer_id,running_total
)
select customer_id,max(budget) as budget,count(product_id) as no_of_products,STRING_AGG(product_id,',') as list_of_products
from cte2 group by customer_id