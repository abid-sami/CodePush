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
@EmployeeCount VARCHAR(10),
@RESULT INT OUTPUT
AS
BEGIN
SELECT @RESULT=COUNT(*) FROM Employee WHERE Department=@EmployeeCount;
END;

DECLARE @CountTotal INT
EXEC GetEmployeeCount CSE, @CountTotal OUTPUT; 
PRINT @CountTotal;



CREATE PROC GetMaximumSalary
@MaximumSalary INT,
@RESULT INT
AS
BEGIN
SELECT @RESULT=MAX(SALARY) FROM Employee WHERE Department=@MaximumSalary;
END;

DECLARE @CountTotal INT
EXEC GetMaximumSalary CSE, @CountTotal OUTPUT; 
PRINT @CountTotal;

Drop PROC GetDeptTotalSalary;



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
