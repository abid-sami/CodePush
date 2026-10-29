CREATE DATABASE SAMI4;
USE SAMI4;

CREATE TABLE Student(
	StudentID int,
	StudentName varchar(20),
	Department varchar(10),
	CGPA float
)

CREATE TABLE Enrollment(
	EnrollmentID int,
	StudentID int,
	CourseName varchar(20),
	Marks float
)

INSERT INTO Student (StudentID, StudentName, Department, CGPA) VALUES
(102, 'Karim', 'BBA', 3.25),
(104, 'Sumi', 'EEE', 3.45),
(101, 'Rahim', 'CSE', 3.65),
(105, 'Fahim', 'CSE', 3.10),
(103, 'Nadia', 'CSE', 3.90);

SELECT * FROM Student;

INSERT INTO Enrollment (EnrollmentID, StudentID, CourseName, Marks) VALUES
(1, 101, 'DBMS', 85),
(2, 102, 'Programming', 72),
(3, 103, 'DBMS', 92),
(4, 104, 'Networking', 78),
(5, 105, 'DBMS', 68);

SELECT * FROM Enrollment;

CREATE INDEX SortStudent ON Student(StudentID);

CREATE NONCLUSTERED INDEX NonClusteredDept on Student (Department);

CREATE NONCLUSTERED INDEX NonClusteredCGPA on Student (CGPA);
SELECT * FROM Student WHERE CGPA>3.50;

CREATE NONCLUSTERED INDEX NonClusteredEmployeID on Enrollment (EnrollmentID);

CREATE NONCLUSTERED INDEX NonClusteredCourse on Enrollment (CourseName);

CREATE NONCLUSTERED INDEX NonClusteredCSECGPA on Student (Department, CGPA) WHERE Department='CSE' AND CGPA>3.50;

