CREATE DATABASE SAMI7;
USE SAMI7;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Department VARCHAR(20),
    Age INT,
    CGPA DECIMAL(3,2)
);

INSERT INTO Student VALUES
(401, 'Nabil', 'CSE', 22, 3.70),
(402, 'Sohana', 'EEE', 21, 3.85),
(403, 'Rakib', 'CSE', 23, 3.40),
(404, 'Priya', 'BBA', 22, 3.90),
(405, 'Fahad', 'EEE', 24, 3.60);

CREATE TABLE Course (
    CourseID VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(50),
    Credit INT
);

INSERT INTO Course VALUES
('C301', 'DBMS', 3),
('C302', 'Operating System', 3),
('C303', 'Mathematics', 2);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID VARCHAR(10),
    Marks INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Enrollment VALUES
(1, 401, 'C301', 85),
(2, 402, 'C301', 78),
(3, 403, 'C302', 72),
(4, 404, 'C303', 90),
(5, 405, 'C302', 65);

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

INSERT INTO Department VALUES
(10, 'Administration'),
(20, 'Engineering'),
(30, 'Accounts');

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT,
    Salary INT,
    City VARCHAR(30),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

INSERT INTO Employee VALUES
(701, 'Rafiq', 10, 42000, 'Dhaka'),
(702, 'Tisha', 10, 53000, 'Rajshahi'),
(703, 'Noman', 20, 48000, 'Dhaka'),
(704, 'Sabila', 20, 62000, 'Khulna'),
(705, 'Farhan', 30, 75000, 'Rajshahi');

CREATE TABLE Enroll (
    ProjectID VARCHAR(10) PRIMARY KEY,
    ProjectName VARCHAR(50),
    EmpID INT,
    Budget INT,
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);

INSERT INTO Enroll VALUES
('P31', 'Office System', 701, 45000),
('P32', 'Web Development', 702, 70000),
('P33', 'Mobile App', 703, 55000),
('P34', 'Management System', 704, 85000),
('P35', 'Accounting Software', 705, 95000);

SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM Enroll;