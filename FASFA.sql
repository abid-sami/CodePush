CREATE DATABASE SAMI3;
USE SAMI3;

CREATE TABLE Employee(
	EmoployeeID int,
	EmployeeName varchar(20),
	Department varchar(10),
	Salary int
)

INSERT INTO Employee (EmoployeeID, EmployeeName, Department, Salary) VALUES
(101, 'Rahim', 'CSE', 45000),
(102, 'Karim', 'EEE', 38000),
(103, 'Sumaiya', 'CSE', 52000),
(104, 'Nusrat', 'BBA', 52000),
(105, 'Hasan', 'CSE', 60000);

SELECT * FROM Employee;

CREATE PROC GetEmployeeDetails
AS BEGIN
SELECT * FROM Employee;
END;
EXEC GetEmployeeDetails


CREATE PROC EmployeeSalary
@RANGE INT
AS
BEGIN
SELECT * FROM Employee WHERE Salary >@RANGE;
END;
EXEC EmployeeSalary 50000;


CREATE PROC EmployeeDept
@DEPT VARCHAR(10)
AS
BEGIN
SELECT * FROM Employee WHERE EmoployeeID=@Dept;
END;
EXEC EmployeeDept CSE;


CREATE PROC GetEmployeeByID
@ID INT
AS
BEGIN
SELECT * FROM Employee WHERE EmoployeeID=@ID;
END;
EXEC GetEmployeeByID 103;


CREATE PROC GetEmployeeByMinimumSalary
@EmSalary INT
AS
BEGIN
SELECT * FROM Employee WHERE Salary>@EmSalary;
END;
EXEC GetEmployeeByMinimumSalary 45000;


CREATE PROC GetEmployeeCount
@DEPT VARCHAR(10),
@RESULT INT OUTPUT
AS
BEGIN
SELECT @RESULT=COUNT(*) FROM Employee WHERE Department=@DEPT;
END;

DECLARE @CountTotal INT
EXEC GetEmployeeCount 'CSE', @CountTotal OUTPUT; 
PRINT @CountTotal;



CREATE PROC GetMaximumSalary
@DEPT varchar(20),
@RESULT INT output
AS
BEGIN
SELECT @RESULT=MAX(Salary) FROM Employee WHERE Department=@DEPT;
END;

DECLARE @CountTotal INT
EXEC GetMaximumSalary 'CSE', @CountTotal OUTPUT; 
PRINT @CountTotal;

Drop PROC GetEmployeeCount;



CREATE PROC GetDeptTotalSalary
@DEPT varchar(20),
@RESULT INT OUTPUT
AS
BEGIN
SELECT @RESULT=SUM(Salary) FROM Employee WHERE Department=@DEPT;
END;

DECLARE @CountTotal INT
EXEC GetDeptTotalSalary 'EEE', @CountTotal OUTPUT; 
PRINT @CountTotal;

CREATE PROC InserData
@ID INT,
@NAME VARCHAR(20),
@DEPT VARCHAR(20),
@SALARY INT
AS
BEGIN
INSERT INTO Employee VALUES(@ID,
@NAME,
@DEPT,
@SALARY);
END;

EXEC InserData 110, 'SAMI', CSE, 10000;
SELECT * FROM Employee;

