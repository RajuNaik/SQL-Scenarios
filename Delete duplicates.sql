drop table if EXISTS STUDENT

CREATE TABLE STUDENT(
    STD_ID        INT,
    STD_FNAME    VARCHAR(20),
    STD_LNAME    VARCHAR(20)
);

select * from student order by STD_ID;

INSERT INTO STUDENT
SELECT 1,'Peter','Parker' UNION ALL
SELECT 2,'James', 'Watson' UNION ALL
SELECT 1,'Peter','Parker' UNION ALL
SELECT 2,'James', 'Watson' UNION ALL
SELECT 2,'James', 'Watson' UNION ALL
SELECT 2,'James', 'Watson' UNION ALL
SELECT 3,'Jake','Jake2' UNION ALL
SELECT 4,'John', 'John2' UNION ALL
SELECT 5,'Perk','Perk2' UNION ALL
SELECT 6,'Nori', 'Nori2' UNION ALL
SELECT 6,'Nori', 'Nori2' UNION ALL
SELECT 6,'Nori', 'Nori2' 



--Identify and delete duplciate records 

--Identifying duplicates without CTE
select * from (
select STD_ID,STD_FNAME,STD_LNAME,ROW_NUMBER() over(partition by STD_ID,STD_FNAME,STD_LNAME order by STD_ID,STD_FNAME,STD_LNAME)
as RN from STUDENT
)X where X.RN>1


--Identifying duplicates with CTE

with temp_table as(
select STD_ID,STD_FNAME,STD_LNAME,ROW_NUMBER() over(partition by STD_ID,STD_FNAME,STD_LNAME order by STD_ID,STD_FNAME,STD_LNAME)
as RN from STUDENT)
select * from temp_table where temp_table.RN>1

--deleting duplicates using CTE

with temp_table as(
select STD_ID,STD_FNAME,STD_LNAME,ROW_NUMBER() over(partition by STD_ID,STD_FNAME,STD_LNAME order by STD_ID,STD_FNAME,STD_LNAME)
as RN from STUDENT)
delete from temp_table where temp_table.RN>1