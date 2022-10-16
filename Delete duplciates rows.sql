select * from users

select * into users_bkp from users where users_id in(1,2,3,4)

select * from users_bkp order by users_id;
insert into users_bkp values(3,'No','client')

with cte1 as(
select users_id,banned,role,row_number() over(partition by users_id,banned,role order by users_id,banned,role ) rn from users_bkp
)
delete from cte1 where rn>1