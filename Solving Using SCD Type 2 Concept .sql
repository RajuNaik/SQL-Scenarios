create table billings 
(
emp_name varchar(10),
bill_date date,
bill_rate int
);
delete from billings;
insert into billings values
('Sachin','01-JAN-1990',25)
,('Sehwag' ,'01-JAN-1989', 15)
,('Dhoni' ,'01-JAN-1989', 20)
,('Sachin' ,'05-Feb-1991', 30)
;

create table HoursWorked 
(
emp_name varchar(20),
work_date date,
bill_hrs int
);
insert into HoursWorked values
('Sachin', '01-JUL-1990' ,3)
,('Sachin', '01-AUG-1990', 5)
,('Sehwag','01-JUL-1990', 2)
,('Sachin','01-JUL-1991', 4)

select * from billings;
select * from HoursWorked;

--to perform scd type2

with cte1 as(
select emp_name,min(bill_date) min_billdate,max(bill_date) max_billdate from billings group by emp_name
), cte2 as(
select cte1.*,b.bill_rate first_bill_rate from cte1 cte1 join billings b
on b.bill_date=cte1.min_billdate and cte1.emp_name=b.emp_name
),cte3 as(
select cte2.*,b.bill_rate second_bill_rate from cte2 cte2 join billings b
on b.bill_date=cte2.max_billdate and cte2.emp_name=b.emp_name
),cte4 as(
select cte3.*,h.work_date,h.bill_hrs from cte3 left outer join HoursWorked h
on cte3.emp_name=h.emp_name
),cte5 as(
select *,case when work_date>=min_billdate and work_date<max_billdate then first_bill_rate*bill_hrs
when work_date>=max_billdate then second_bill_rate*bill_hrs end as charges from cte4
)
select emp_name,sum(charges) total_charges from cte5 where charges is not null group by emp_name 