
drop table person

create table person(
PersonID NVARCHAR(10),
Name	NVARCHAR(10),
Email	NVARCHAR(100),
Score int)


insert into person values('1',	'Alice',	'alice2018@hotmail.com',	88),
('2',	'Bob',	'bob2018@hotmail.com',	11),
('3',	'Davis',	'davis2018@hotmail.com',	27),
('4',	'Tara',	'tara2018@hotmail.com',	45),
('5',	'John',	'john2018@hotmail.com',	63)

create table friend(

    PersonID NVARCHAR(10),	
    FriendID NVARCHAR(10)

)



insert into friend values('1',	'2'),
('1',	'3'),
('2',	'1'),
('2',	'3'),
('3',	'5'),
('4',	'2'),
('4',	'3'),
('4',	'5')


select * from person;
select * from friend;



select * from person;
select * from friend;

with cte1 as(
select f.PersonID,p.Name,f.friendID from person as p,friend as f 
where p.PersonID=f.PersonID
),cte2 as (
select cte1.PersonID,cte1.Name,p.Score from cte1 as cte1,person as p where cte1.friendID=p.PersonID
)
select cte2.PersonID,cte2.Name,count(cte2.name) as no_of_friends,sum(cte2.score) as total_friend_score from cte2 as cte2
group by cte2.PersonID,cte2.Name having sum(cte2.score)>100

