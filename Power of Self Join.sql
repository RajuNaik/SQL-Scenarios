create table business_city (
business_date date,
city_id int
);
delete from business_city;
insert into business_city
values(cast('2020-01-02' as date),3),(cast('2020-07-01' as date),7),(cast('2021-01-01' as date),3),(cast('2021-02-03' as date),19)
,(cast('2022-12-01' as date),3),(cast('2022-12-15' as date),3),(cast('2022-02-28' as date),12);

select * from business_city ;

WITH cte1 AS(
SELECT MIN(YEAR(business_date)) as "year", city_id FROM business_city
GROUP BY city_id)
SELECT year, COUNT(city_id) AS no_of_city FROM cte1
GROUP BY year;

