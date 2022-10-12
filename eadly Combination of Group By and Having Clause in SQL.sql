create table exams (student_id int, subject varchar(20), marks int);
delete from exams;
insert into exams values (1,'Chemistry',91),(1,'Physics',91)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80)
,(4,'Chemistry',71),(4,'Physics',54);

select * from exams;

select student_id from exams
where subject in('Chemistry','Physics')
group by student_id
having count(distinct subject)=2 and COUNT(distinct marks)=1




with cte1 as(
select * from exams where subject='Physics'
),cte2 as(
select * from exams where subject='Chemistry'
)
select cte1.student_id from cte1 as cte1,cte2 as cte2 where cte1.student_id=cte2.student_id and cte1.marks=cte2.marks