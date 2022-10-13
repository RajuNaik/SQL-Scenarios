create table employee 
(
emp_id int,
company varchar(10),
salary int
);

insert into employee values (1,'A',2341)
insert into employee values (2,'A',341)
insert into employee values (3,'A',15)
insert into employee values (4,'A',15314)
insert into employee values (5,'A',451)
insert into employee values (6,'A',513)
insert into employee values (7,'B',15)
insert into employee values (8,'B',13)
insert into employee values (9,'B',1154)
insert into employee values (10,'B',1345)
insert into employee values (11,'B',1221)
insert into employee values (12,'B',234)
insert into employee values (13,'C',2345)
insert into employee values (14,'C',2645)
insert into employee values (15,'C',2645)
insert into employee values (16,'C',2652)
insert into employee values (17,'C',65);

select * from employee;

with cte1 as(
select emp_id,company,salary,row_number() over(partition by company order by salary ) rn,
count(1) over(partition by company) total_cnt
 from employee
),cte2 as(
select company,salary,rn,total_cnt*1.0/2 as c1,total_cnt*1.0/2 + 1 as c2 from cte1
where rn BETWEEN total_cnt*1.0/2 and total_cnt*1.0/2 + 1
)
select company,avg(salary) median from cte2 group by company