CREATE TABLE subscriber (
 sms_date date ,
 sender varchar(20) ,
 receiver varchar(20) ,
 sms_no int
);
-- insert some values
INSERT INTO subscriber VALUES ('2020-4-1', 'Avinash', 'Vibhor',10);
INSERT INTO subscriber VALUES ('2020-4-1', 'Vibhor', 'Avinash',20);
INSERT INTO subscriber VALUES ('2020-4-1', 'Avinash', 'Pawan',30);
INSERT INTO subscriber VALUES ('2020-4-1', 'Pawan', 'Avinash',20);
INSERT INTO subscriber VALUES ('2020-4-1', 'Vibhor', 'Pawan',5);
INSERT INTO subscriber VALUES ('2020-4-1', 'Pawan', 'Vibhor',8);
INSERT INTO subscriber VALUES ('2020-4-1', 'Vibhor', 'Deepak',50);


select * from subscriber;




select * from subscriber;

with cte1 as(
select sms_date,
case when sender<receiver then sender else receiver end as p1,
case when sender>receiver then sender else receiver end as p2,
sms_no
from subscriber
)
select sms_date,p1 as person1,p2 as person2,sum(sms_no) total_sms_exchanged from cte1
group by sms_date,p1,p2 order by sms_date,p1,p2 