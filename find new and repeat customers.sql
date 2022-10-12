create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);
insert into customer_orders values(1,100,cast('2022-01-01' as date),2000);
insert into customer_orders values(2,200,cast('2022-01-01' as date),2500);
insert into customer_orders values(3,300,cast('2022-01-01' as date),2100);
insert into customer_orders values(4,100,cast('2022-01-02' as date),2000);
insert into customer_orders values(5,400,cast('2022-01-02' as date),2200);
insert into customer_orders values(6,500,cast('2022-01-02' as date),2700);
insert into customer_orders values(7,100,cast('2022-01-03' as date),3000);
insert into customer_orders values(8,400,cast('2022-01-03' as date),1000);
insert into customer_orders values(9,600,cast('2022-01-03' as date),3000);



select * from customer_orders;

with temp_tab1 as(
Select customer_id,min(order_date) as first_visit from customer_orders group by customer_id
),temp_tab2 as(
select tb1.first_visit,co.* from temp_tab1 as tb1 join customer_orders as co on tb1.customer_id=co.customer_id
)
select order_date,sum(case when first_visit=order_date then 1 else 0 end) as first_customer,
sum(case when first_visit!=order_date then 1 else 0 end) as repeat_customer  from temp_tab2 group by order_date

