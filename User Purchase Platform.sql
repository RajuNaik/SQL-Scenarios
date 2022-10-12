create table spending 
(
user_id int,
spend_date date,
platform varchar(10),
amount int
);

insert into spending values(1,'2019-07-01','mobile',100),(1,'2019-07-01','desktop',100),(2,'2019-07-01','mobile',100)
,(2,'2019-07-02','mobile',100),(3,'2019-07-01','desktop',100),(3,'2019-07-02','desktop',100);



select * from spending

select spend_date,user_id,min(platform) platform,sum(amount) total_amount,count(distinct user_id) no_of_users
from spending group by spend_date,user_id having count(distinct platform)=1
union all
select spend_date,user_id,'both' platform,sum(amount) total_amount,count(distinct user_id) no_of_users
from spending group by spend_date,user_id having count(distinct platform)=2
order by spend_date,platform desc 