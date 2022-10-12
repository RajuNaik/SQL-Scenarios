--create and insert script for this problem. Do try yourself without using CTE.

create table sales (
product_id int,
period_start date,
period_end date,
average_daily_sales int
);

insert into sales values(1,'2019-01-25','2019-02-28',100),(2,'2018-12-01','2020-01-01',10),(3,'2019-12-01','2020-01-31',1);

select * from sales;

with cte as(
select min(period_start) dates,max(period_end) max_date from sales
union all
select dateadd(day,1,dates) dates,max_date from cte where dates<max_date
),cte1 as(
select * from cte 
join sales on dates BETWEEN period_start and period_end 
)
select product_id,DATEPART(year,dates) as year,sum(average_daily_sales) sales from cte1
group by product_id,DATEPART(year,dates) order by product_id,DATEPART(year,dates)
OPTION(maxrecursion 10000)