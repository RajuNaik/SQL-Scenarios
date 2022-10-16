-----------------------------------------------------------------------------------------------------
create table emp_manager(emp_id int,emp_name varchar(20),salary int,manager_id int)
insert into emp_manager values(1,'Ankit',10000,4);
insert into emp_manager values(2,'Mohit',15000,5);
insert into emp_manager values(3,'Vikas',10000,4);
insert into emp_manager values(4,'Rohit',5000,2);
insert into emp_manager values(5,'Mudit',12000,6);
insert into emp_manager values(6,'Agam',12000,2);
insert into emp_manager values(7,'Sanjay',9000,2);
insert into emp_manager values(8,'Ashish',5000,2);

select * from emp_manager;

with cte1 as(
select e.emp_id,e.emp_name,m.emp_name as manager_name,e.salary as emp_salary,m.salary as manager_salary
 from emp_manager e join emp_manager m on e.manager_id=m.emp_id
)
select * from cte1 where emp_salary>manager_salary