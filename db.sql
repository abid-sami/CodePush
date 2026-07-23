create database sami1;
use sami1;

create table stu(
	id INT,
	name varchar(20),
	age INT,
	dept varchar(20),
	salary INT
);

insert into stu values(1, 'John Doe', 30, 'IT', 60000, 017175);
insert into stu values(2, 'Jane Smith', 25, 'HR', 55000);
insert into stu values(3, 'Sam Brown', 35, 'Finance', 75000);
insert into stu values(4, 'Lisa White', 28, 'IT', 62000);
insert into stu values(5, 'Adam Green', 40, 'HR', 80000);

select * from stu;

select * from stu where dept='IT';

select * from stu where salary=600000;

select * from stu where id=1 OR id=2;

select * from stu where name  like 'j%' AND name like '%h';

select * from stu where name  like '___a%';

select * from stu where dept in ('IT','HR');

select * from stu where salary between  70000 and 80100;

select distinct dept from stu; 

ALTER TABLE STU ADD NUMBER INT;

ALTER TABLE STU DROP COLUMN AGE;

ALTER TABLE STU RENAME COLUMN NUMBER TO PHONE NUMBER;

drop table stu;


select * from Teacher;
use lab1;

