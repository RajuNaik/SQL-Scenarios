create table a(col1 int)

create table b(col1 int)

insert into a values(1)
insert into b values(1)

select * from a;
select * from b;

select * from a inner join b on a.col1=b.col1
select * from a left join b on a.col1=b.col1
select * from a right join b on a.col1=b.col1
select * from a full outer join b on a.col1=b.col1

truncate table a
truncate table b