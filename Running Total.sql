select ProductID,NAME,listprice,sellstartdate from [SalesLT].[Product] order by sellstartdate desc,ProductID asc

select ProductID,listprice,sellstartdate,
sum(listprice) over(order by sellstartdate asc,ProductID asc rows between unbounded preceding and 0 preceding) as running_total,
avg(listprice) over(order by sellstartdate asc,ProductID asc rows between unbounded preceding and 0 preceding) as running_avg,
min(listprice) over(order by sellstartdate asc,ProductID asc rows between unbounded preceding and 0 preceding) as running_min,
max(listprice) over(order by sellstartdate asc,ProductID asc rows between unbounded preceding and 0 preceding) as running_max
from [SalesLT].[Product]