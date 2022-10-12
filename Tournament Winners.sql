create table players
(player_id int,
group_id int)

insert into players values (15,1);
insert into players values (25,1);
insert into players values (30,1);
insert into players values (45,1);
insert into players values (10,2);
insert into players values (35,2);
insert into players values (50,2);
insert into players values (20,3);
insert into players values (40,3);

create table matches
(
match_id int,
first_player int,
second_player int,
first_score int,
second_score int)

insert into matches values (1,15,45,3,0);
insert into matches values (2,30,25,1,2);
insert into matches values (3,30,15,2,0);
insert into matches values (4,40,20,5,2);
insert into matches values (5,35,50,1,1);



select * from players;
select * from matches;

with cte1 as (
select first_player as player,first_score as score from matches
union all
select second_player as player,second_score as score from matches
),cte2 as(
select p.group_id,cte1.player player_id,sum(cte1.score) as total_score from players p,cte1 cte1 where p.player_id=cte1.player
group by p.group_id,cte1.player 
),cte3 as (
select cte2.*,rank() over(partition by group_id order by total_score desc,player_id asc) as rnk from cte2 cte2
)
select cte3.group_id,cte3.player_id,cte3.total_score from cte3 cte3 where cte3.rnk=1

