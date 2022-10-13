CREATE TABLE [students](
 [studentid] [int] NULL,
 [studentname] [nvarchar](255) NULL,
 [subject] [nvarchar](255) NULL,
 [marks] [int] NULL,
 [testid] [int] NULL,
 [testdate] [date] NULL
)
data:
insert into students values (2,'Max Ruin','Subject1',63,1,'2022-01-02');
insert into students values (3,'Arnold','Subject1',95,1,'2022-01-02');
insert into students values (4,'Krish Star','Subject1',61,1,'2022-01-02');
insert into students values (5,'John Mike','Subject1',91,1,'2022-01-02');
insert into students values (4,'Krish Star','Subject2',71,1,'2022-01-02');
insert into students values (3,'Arnold','Subject2',32,1,'2022-01-02');
insert into students values (5,'John Mike','Subject2',61,2,'2022-11-02');
insert into students values (1,'John Deo','Subject2',60,1,'2022-01-02');
insert into students values (2,'Max Ruin','Subject2',84,1,'2022-01-02');
insert into students values (2,'Max Ruin','Subject3',29,3,'2022-01-03');
insert into students values (5,'John Mike','Subject3',98,2,'2022-11-02');

select * from students;

--Question1:
/*write the sql query to get the list of students who scored above the average marks in each subject*/
with cte1 as(
select subject,avg(marks) avg_marks from students group by subject
)select *  from cte1 c join students s
on c.subject=s.subject and
s.marks> c.avg_marks


--Question 2
--write the sql query to get the % of students who score more than 90 in any subject amongst the total students 
with cte1 as(
select *,case when marks>90 then studentid else null end as std_id from students
)
select count(distinct std_id)*1.0/count(distinct studentid) from cte1;


--Question3
--write a query to get the second highest and second lowest marks for each subject
with cte1 as(
select studentid,subject,marks,dense_rank() over(partition by subject order by marks) as rnk1,
dense_rank() over(partition by subject order by marks desc) as rnk2
from students
)
select cte1.subject,cte2.marks as second_highest,cte1.marks as second_lowest from cte1 cte1 
     join
     cte1 cte2
     on cte1.subject=cte2.subject
     where cte1.rnk1=2 and cte2.rnk2=2

--Question 4:
--for each student and test,identify if their marks increased or decreased from their previous test

select * from students order by studentid,testdate,subject;

with cte1 as(
select *,lag(marks) over(partition by studentid order by testdate , subject) as prev_marks from students
)
select *,
case when marks<prev_marks then 'decreased'
when marks>prev_marks then 'increased'
else null end as status from cte1 