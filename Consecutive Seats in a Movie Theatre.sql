create table movie(
seat varchar(50),occupancy int
);
insert into movie values('a1',1),('a2',1),('a3',0),('a4',0),('a5',0),('a6',0),('a7',1),('a8',1),('a9',0),('a10',0),
('b1',0),('b2',0),('b3',0),('b4',1),('b5',1),('b6',1),('b7',1),('b8',0),('b9',0),('b10',0),
('c1',0),('c2',1),('c3',0),('c4',1),('c5',1),('c6',0),('c7',1),('c8',0),('c9',0),('c10',1);

select * from movie;

select SUBSTRING(seat,2,1) as seat_no from movie;
--to find the consecutive seats--

with cte1 as(
select *,substring(seat,1,1) as row_id,cast(SUBSTRING(seat,2,2) as int) as seat_id from movie
), cte2 as(
select seat,occupancy,row_id,seat_id as seat_id,
max(occupancy) over(partition by row_id order by seat_id rows between current row and 3 following ) as mx ,
count(occupancy) over(partition by row_id order by seat_id rows between current row and 3 following ) as cnt 
from cte1
),cte3 as(
select * from cte2 where mx=0 and cnt=4
)select cte2.seat,cte2.occupancy,cte2.cnt 
from cte2 cte2 join cte3 cte3 on cte2.row_id=cte3.row_id
and cte2.seat_id between cte3.seat_id and cte3.seat_id+3


--where mx=0 and cnt=4