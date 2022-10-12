create table bms (seat_no int ,is_empty varchar(10));
insert into bms values
(1,'N')
,(2,'Y')
,(3,'N')
,(4,'Y')
,(5,'Y')
,(6,'Y')
,(7,'N')
,(8,'Y')
,(9,'Y')
,(10,'Y')
,(11,'Y')
,(12,'N')
,(13,'Y')
,(14,'Y');

select * from bms; --to find 3 or more consecutive seats--there are 3 ways-one is lead and lag and advanced aggregate
--lead function is for next row and lag function for previuos row
--
with cte1 as(
select seat_no,is_empty,
lag(is_empty,1) over(order by seat_no) prev_1,
lag(is_empty,2) over(order by seat_no) prev_2,
lead(is_empty,1) over(order by seat_no) nxt_1,
lead(is_empty,2) over(order by seat_no) nxt_2
from bms 
)
select seat_no from cte1 where is_empty='Y' and 
((prev_1='Y' and prev_2='Y') or (nxt_1='Y' and nxt_2='Y') or (prev_1='Y' and nxt_1='Y'))


select * from bms;


with cte1 as(
select seat_no,is_empty,
ROW_NUMBER() OVER(order by seat_no) rn, 
seat_no-ROW_NUMBER() OVER(order by seat_no) rn_diff
from bms where is_empty='Y'
),cte2 as(
select rn_diff,count(1) cnt from cte1 group by rn_diff
having count(1)>=3
)
select seat_no from cte1 where rn_diff in(select rn_diff from cte2)