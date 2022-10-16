create table call_details  (
call_type varchar(10),
call_number varchar(12),
call_duration int
);

insert into call_details
values ('OUT','181868',13),('OUT','2159010',8)
,('OUT','2159010',178),('SMS','4153810',1),('OUT','2159010',152),('OUT','9140152',18),('SMS','4162672',1)
,('SMS','9168204',1),('OUT','9168204',576),('INC','2159010',5),('INC','2159010',4),('SMS','2159010',1)
,('SMS','4535614',1),('OUT','181868',20),('INC','181868',54),('INC','218748',20),('INC','2159010',9)
,('INC','197432',66),('SMS','2159010',1),('SMS','4535614',1);


select * from call_details order by call_number

--write sql to satisfy below conditions
--numbers have both incoming and outgoing calls
--sum of duration of outgoing calls > sum of duration of incoming calls

with cte1 as(
select call_number,
sum(case when call_type='OUT' then call_duration else null end) as out_dur,
sum(case when call_type='INC' then call_duration else null end) as in_dur from call_details
group by call_number
)
select * from cte1 where out_dur is not null and in_dur is not null and out_dur>in_dur