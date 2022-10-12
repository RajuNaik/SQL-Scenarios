CREATE TABLE STORES (
Store varchar(10),
Quarter varchar(10),
Amount int);

INSERT INTO STORES (Store, Quarter, Amount)
VALUES ('S1', 'Q1', 200),
('S1', 'Q2', 300),
('S1', 'Q4', 400),
('S2', 'Q1', 500),
('S2', 'Q3', 600),
('S2', 'Q4', 700),
('S3', 'Q1', 800),
('S3', 'Q2', 750),
('S3', 'Q3', 900);


select * from STORES;

--find the missing Q for each store.

with cte1 as (
select store,quarter,
case
when quarter='Q1' then 1
when quarter='Q2' then 2
when quarter='Q3' then 3
when quarter='Q4' then 4
end as num from STORES
),cte2 as(
select store,sum(num) total,10-sum(num) as missing_Q from cte1 group by store 
)
select store,
case
when missing_Q='1' then 'Q1'
when missing_Q='2' then 'Q2'
when missing_Q='3' then 'Q3'
when missing_Q='4' then 'Q4'
end as missing_quarter from cte2 order by store