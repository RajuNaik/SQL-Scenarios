select GETDATE()

--date part
--date add
--date diff

select DATEPART(weekday,getdate())

select DATEADD(year,-1,getdate())

select DATEDIFF(month,getdate(),DATEADD(year,-1,getdate()))


DECLARE @inputdate date;
DECLARE @n int;
SET @inputdate ='2022-10-09'
SET @n=4
select dateadd(week,@n-1,DATEADD(day,8 - datepart(weekday,@inputdate),@inputdate))