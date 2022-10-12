select ProductID,NAME,listprice,sellstartdate from [SalesLT].[Product] order by listprice desc

with cte1 as(
select sum(listprice)*0.8 as pareto from [SalesLT].[Product] --175724.47200
),
cte2 as(
select ProductID,NAME,listprice,sum(listprice) over(order by listprice desc rows between unbounded preceding and 0 preceding)
as running_total from [SalesLT].[Product]
)
select * from cte2,cte1 where cte2.running_total<=cte1.pareto
