Drop Table Department;
Drop Table Department_Employee;
Drop Table Department_Manager;
Drop Table Salary;
Drop Table Titles;
Drop Table Employees;

Create Table Department (
Dept_no VARCHAR(30) PRIMARY KEY,
Dept_name VARCHAR(30) NOT NULL);

Create Table Department_Employee(
Emp_no VARCHAR(30) PRIMARY KEY,
Dept_no VARCHAR(30) NOT NULL,
FOREIGN KEY (Dept_no) REFERENCES Department(Dept_no));

Create Table Department_Manager(
Dept_no VARCHAR(30) NOT NULL,
Emp_no VARCHAR(30) PRIMARY KEY,
FOREIGN KEY (Dept_no) REFERENCES Department(Dept_no));

Create Table Salary(
Emp_no VARCHAR(30) PRIMARY KEY,
Salary VARCHAR(30) NOT NULL,
FOREIGN KEY (Emp_no) REFERENCES Department_Employee(Emp_no),
FOREIGN KEY (Emp_no) REFERENCES Department_Manager(Emp_no)
);

Create Table Titles(
Title VARCHAR(30) NOT NULL,
Title_ID VARCHAR(30) PRIMARY KEY);

Create Table Employees(
Emp_No VARCHAR(30) NOT NULL,
Emp_title VARCHAR(30) NOT NULL,
birthday DATE,
First_Name VARCHAR(30),
Last_Name VARCHAR(30),
Sex VARCHAR(30),
Hire_Date Date,
FOREIGN KEY (Emp_title) REFERENCES Titles(Title_ID),
FOREIGN KEY (Emp_no) REFERENCES Salary(Emp_no));

--Question 1
SELECT E.Emp_No, E.Last_Name, E.First_Name, E.Sex , S.Salary
FROM  Employees E
JOIN  Salary S
ON (E.Emp_No = S.Emp_No);

--Question 2
Select First_Name, Last_Name, Hire_Date
From Employees
Where Hire_Date >= '1986-01-01' And Hire_Date <= '1986-12-31'

--Question 3
Select M.Dept_no, D.Dept_Name, E.Emp_no, E.Last_Name, E.First_Name
FROM  Employees E
JOIN Department_Manager AS M
  ON E.Emp_no = M.Emp_no 
JOIN Department AS D
  ON M.Dept_no = D.Dept_no;

--Question 4
Select D.Dept_no, D.Dept_Name, E.Emp_no, E.Last_Name, E.First_Name
FROM  Employees As E
JOIN Department_Employee AS M
  ON E.Emp_no = M.Emp_no 
JOIN Department AS D
  ON M.Dept_no = D.Dept_no;
  
--Question 5
Select First_Name, Last_Name, Sex
From Employees
Where First_Name = 'Hercules' And Last_Name Like 'B%';

--Question 6
Select E.Emp_no, E.Last_Name, E.First_Name, D.dept_name
FROM Employees E
  Inner JOIN Department_Employee AS M
    ON E.Emp_no = M.Emp_no 
  Inner JOIN Department AS D
    ON M.Dept_no = D.Dept_no
Where D.Dept_Name = 'Sales'
Order by E.emp_no;


--Question 7
Select E.Emp_no, E.Last_Name, E.First_Name
FROM Employees E
	JOIN Department AS D
 	ON M.Dept_no = D.Dept_no
	JOIN Department_Employee AS M
  	ON E.Emp_no = M.Emp_no 
Where D.Dept_Name = 'Sales' And D.Dept_Name = 'Development';

--Question 8
SELECT Last_Name, COUNT(Last_Name) AS "Employees count"
FROM Employees
GROUP BY Last_Name
ORDER BY "Employees count" DESC;