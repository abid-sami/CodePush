
-- ==========================================
-- DATABASE MANAGEMENT SYSTEM LAB FINAL TEST
-- Course Code: CSE 3104
-- ==========================================

-- SET 1

-- Q1. STORED PROCEDURE

CREATE PROCEDURE GetStudent
    @StudentID INT
AS
BEGIN
    SELECT StudentName, Department
    FROM Student
    WHERE StudentID=@StudentID;
END;

EXEC GetStudent @StudentID=402;


-- Q2. CLUSTERED AND NON-CLUSTERED INDEX

CREATE CLUSTERED INDEX IX_StudentID
ON Student(StudentID);

CREATE NONCLUSTERED INDEX IX_Department
ON Student(Department);

SELECT * FROM Student
ORDER BY CGPA DESC;


-- Q3. CREATE VIEW USING INNER JOIN

CREATE VIEW StudentCourseDetails AS
SELECT Student.StudentName, Course.CourseName,
Course.Credit, Enrollment.Marks
FROM Student
INNER JOIN Enrollment
ON Student.StudentID=Enrollment.StudentID
INNER JOIN Course
ON Enrollment.CourseID=Course.CourseID;

SELECT * FROM StudentCourseDetails
WHERE Credit=3;


-- Q4. FOREIGN KEY WITH CASCADE

ALTER TABLE Enrollment
ADD CONSTRAINT FK_Course_Enrollment
FOREIGN KEY (CourseID)
REFERENCES Course(CourseID)
ON DELETE CASCADE
ON UPDATE CASCADE;

UPDATE Course
SET CourseID='C305'
WHERE CourseID='C301';

DELETE FROM Course
WHERE CourseID='C303';


-- Q5. INDEXED VIEW

CREATE VIEW DepartmentCGPA_Base
WITH SCHEMABINDING
AS
SELECT Department, StudentID, CGPA
FROM dbo.Student;

CREATE UNIQUE CLUSTERED INDEX IX_DepartmentCGPA
ON DepartmentCGPA_Base(Department, StudentID);

CREATE VIEW DepartmentCGPA AS
SELECT Department,
MAX(CGPA) AS MaximumCGPA,
MIN(CGPA) AS MinimumCGPA
FROM DepartmentCGPA_Base
GROUP BY Department;

SELECT * FROM DepartmentCGPA;


-- Q6. CONVERSION AND MATHEMATICAL FUNCTIONS

SELECT StudentName,
CAST(CGPA AS VARCHAR(10)) AS CGPA_VARCHAR,
CONVERT(INT, CGPA) AS CGPA_INT,
ABS(CGPA-3.50) AS AbsoluteDifference,
POWER(CGPA,2) AS CGPA_Square
FROM Student;


-- ==========================================
-- DBMS LAB FINAL TEST - SET D
-- Course Code: CSE 3104
-- ==========================================


-- Q1. STORED PROCEDURE WITH OUTPUT PARAMETER

CREATE PROCEDURE GetHighestSalary
    @DeptID INT,
    @HighestSalary INT OUTPUT
AS
BEGIN
    SELECT @HighestSalary=MAX(Salary)
    FROM Employee
    WHERE DeptID=@DeptID;
END;

DECLARE @Result INT;

EXEC GetHighestSalary
    @DeptID=20,
    @HighestSalary=@Result OUTPUT;

SELECT @Result AS HighestSalary;


-- Q2. CLUSTERED AND NON-CLUSTERED INDEX

CREATE CLUSTERED INDEX IX_EmpID
ON Employee(EmpID);

CREATE NONCLUSTERED INDEX IX_City
ON Employee(City);

SELECT * FROM Employee
WHERE Salary>50000
ORDER BY Salary DESC;


-- Q3. CREATE VIEW USING THREE TABLES

CREATE VIEW DepartmentProjectView AS
SELECT Department.DeptName, Employee.EmpName,
Employee.City, Enrollment.ProjectName,
Enrollment.Budget
FROM Department
INNER JOIN Employee
ON Department.DeptID=Employee.DeptID
INNER JOIN Enrollment
ON Employee.EmpID=Enrollment.EmpID;

SELECT * FROM DepartmentProjectView
WHERE City='Dhaka';


-- Q4. CREATE INDEXED VIEW

CREATE VIEW DepartmentSalary
WITH SCHEMABINDING
AS
SELECT DeptID,
SUM(Salary) AS TotalSalary,
COUNT_BIG(*) AS TotalEmployees
FROM dbo.Employee
GROUP BY DeptID;

CREATE UNIQUE CLUSTERED INDEX IX_DepartmentSalary
ON DepartmentSalary(DeptID);

CREATE VIEW DepartmentSalaryDetails AS
SELECT D.DeptID, D.TotalSalary,
M.HighestSalary
FROM DepartmentSalary AS D
INNER JOIN
(
    SELECT DeptID, MAX(Salary) AS HighestSalary
    FROM Employee
    GROUP BY DeptID
) AS M
ON D.DeptID=M.DeptID;

SELECT * FROM DepartmentSalaryDetails;


-- Q5. FOREIGN KEY WITH CASCADE

ALTER TABLE Employee
ADD CONSTRAINT FK_Department_Employee
FOREIGN KEY (DeptID)
REFERENCES Department(DeptID)
ON DELETE CASCADE
ON UPDATE CASCADE;

UPDATE Department
SET DeptID=40
WHERE DeptID=20;

DELETE FROM Department
WHERE DeptID=30;


-- Q6. CONVERSION AND MATHEMATICAL FUNCTIONS

SELECT EmpName,
CAST(Salary AS VARCHAR(10)) AS Salary_VARCHAR,
CONVERT(INT, Salary) AS Salary_INT,
ABS(Salary-50000) AS Salary_Difference,
SQRT(Salary) AS Salary_SquareRoot
FROM Employee;


-- ==========================================
-- END OF LAB FINAL TEST
-- ==========================================




-- ==========================================
-- DATABASE MANAGEMENT SYSTEM LAB FINAL TEST
-- Course Code: CSE 3104
-- ==========================================

-- Q1. STORED PROCEDURE

CREATE PROCEDURE GetStudent
    @StudentID INT
AS
BEGIN
    SELECT StudentName, Department
    FROM Student
    WHERE StudentID=@StudentID;
END;

EXEC GetStudent @StudentID=402;


-- Q2. CLUSTERED AND NON-CLUSTERED INDEX

CREATE CLUSTERED INDEX IX_StudentID
ON Student(StudentID);

CREATE NONCLUSTERED INDEX IX_Department
ON Student(Department);

SELECT * FROM Student
ORDER BY CGPA DESC;


-- Q3. CREATE VIEW USING INNER JOIN

CREATE VIEW StudentCourseDetails AS
SELECT S.StudentName, C.CourseName, C.Credit, E.Marks
FROM Student AS S
INNER JOIN Enrollment AS E
ON S.StudentID=E.StudentID
INNER JOIN Course AS C
ON E.CourseID=C.CourseID;

SELECT * FROM StudentCourseDetails
WHERE Credit=3;


-- Q4. FOREIGN KEY WITH CASCADE

ALTER TABLE Enrollment
ADD CONSTRAINT FK_Course_Enrollment
FOREIGN KEY (CourseID)
REFERENCES Course(CourseID)
ON DELETE CASCADE
ON UPDATE CASCADE;

UPDATE Course
SET CourseID='C305'
WHERE CourseID='C301';

DELETE FROM Course
WHERE CourseID='C303';


-- Q5. INDEXED VIEW

CREATE VIEW DepartmentCGPA_Base
WITH SCHEMABINDING
AS
SELECT Department, StudentID, CGPA
FROM dbo.Student;

CREATE UNIQUE CLUSTERED INDEX IX_DepartmentCGPA
ON DepartmentCGPA_Base(Department, StudentID);

CREATE VIEW DepartmentCGPA AS
SELECT Department,
MAX(CGPA) AS MaximumCGPA,
MIN(CGPA) AS MinimumCGPA
FROM DepartmentCGPA_Base
GROUP BY Department;

SELECT * FROM DepartmentCGPA;


-- Q6. CONVERSION AND MATHEMATICAL FUNCTIONS

SELECT StudentName,
CAST(CGPA AS VARCHAR(10)) AS CGPA_VARCHAR,
CONVERT(INT, CGPA) AS CGPA_INT,
ABS(CGPA-3.50) AS AbsoluteDifference,
POWER(CGPA,2) AS CGPA_Square
FROM Student;


-- ==========================================
-- END OF LAB TEST
-- ==========================================