CREATE DATABASE sami2
USE sami2

create table stu(
	ID INT,
	Name varchar(20),
	CGPA FLOAT,
	Dept varchar(20)
);

insert into stu values(1, 'John Doe', 4.0, 'CSE');
insert into stu values(2, 'Jane Smith', 2.5, 'EEE');
insert into stu values(3, 'Sam Brown', 3.5, 'CSE');
insert into stu values(4, 'Lisa White', 2.8, 'BBA');
insert into stu values(5, 'Adam Green', 4.0, 'EEE');

select * from stu;

DROP TABLE STU;

--Rename Column 
SP_RENAME 'stu.stu.Department','Department','COLUMN';

--Sorting
select * from stu ORDER BY CGPA ASC;

--Group Minimum
SELECT MIN(CGPA) FROM STU GROUP BY Dept;

--Count Total Unique Row Datas
SELECT COUNT(*) FROM STU;

SELECT COUNT(Name) FROM STU;

SELECT COUNT(DISTINCT DEPT) FROM STU;

--Find Above CGPA than Avarage
SELECT CGPA FROM STU WHERE CGPA>(SELECT AVG(CGPA) FROM STU);


--Find min, max, avg CGPA of each Dept with dept sorted alphabatically

SELECT Dept, MIN(CGPA) as MinCGPA, Max(CGPA) as MaxCGPA, AVG(CGPA) as AvgCGPA FROM STU GROUP BY Dept ORDER BY Dept ASC;


--Find the Name, ID, Contact, CGPA of the student in CSE dept whose CGPA is maximum

SELECT Name, ID, CGPA FROM stu
WHERE Dept='CSE' AND CGPA=(SELECT MAX(CGPA) FROM stu WHERE Dept='CSE');
