CREATE TABLE [emp_salary]
(
    [emp_id] INTEGER  NOT NULL,
    [name] NVARCHAR(20)  NOT NULL,
    [salary] NVARCHAR(30),
    [dept_id] INTEGER
);


INSERT INTO emp_salary
(emp_id, name, salary, dept_id)
VALUES(101, 'sohan', '3000', '11'),
(102, 'rohan', '4000', '12'),
(103, 'mohan', '5000', '13'),
(104, 'cat', '3000', '11'),
(105, 'suresh', '4000', '12'),
(109, 'mahesh', '7000', '12'),
(108, 'kamal', '8000', '11');

--sql to find all employees whose salary is same in same department


select * from emp_salary order by dept_id,salary

with cte1 as(
select dept_id,salary from emp_salary group by dept_id,salary having count(1)>1
)
select * from cte1 cte1 join emp_salary es on cte1.dept_id=es.dept_id and cte1.salary=es.salary

