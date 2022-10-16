create table airbnb_searches 
(
user_id int,
date_searched date,
filter_room_types varchar(200)
);
delete from airbnb_searches;
insert into airbnb_searches values
(1,'2022-01-01','entire home,private room')
,(2,'2022-01-02','entire home,shared room')
,(3,'2022-01-02','private room,shared room')
,(4,'2022-01-03','private room')

select * from airbnb_searches;

select value from string_split(filter_room_types,',') as sp 

with cte1 as(
select * from airbnb_searches
cross APPLY string_split(filter_room_types,',')
)select value,count(1) as cnt from cte1 group by value order by count(1) desc