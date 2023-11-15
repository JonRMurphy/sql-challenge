--To drop tables if needed:
--drop table if exists Departments, DepartmentEmployees, DepartmentManagers, Employees, Salaries, Titles;

CREATE TABLE Departments (
    DepartmentNumber varchar(4)   NOT NULL,
    DepartmentName varchar(50)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        DepartmentNumber
     )
);

CREATE TABLE DepartmentEmployees (
    EmployeeNumber int   NOT NULL,
    DepartmentNumber varchar(4)   NOT NULL
);

CREATE TABLE DepartmentManagers (
    DepartmentNumber varchar(4)   NOT NULL,
    EmployeeNumber int   NOT NULL
);

CREATE TABLE Employees (
    EmployeeNumber int Primary Key  NOT NULL,
    TitleID varchar(5)   NOT NULL,
    BirthDate varchar(10)   NOT NULL,
    FirstName varchar(30)   NOT NULL,
    LastName varchar(30)   NOT NULL,
    Sex varchar(10)   NOT NULL,
    HireDate varchar(10)   NOT NULL
);

CREATE TABLE Salaries (
    EmployeeNumber int   NOT NULL,
    Salary int Primary Key  NOT NULL
);

CREATE TABLE Titles (
    TitleID varchar(5)   NOT NULL,
    Title varchar(30)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        TitleID
     )
);

ALTER TABLE DepartmentEmployees ADD CONSTRAINT fk_DepartmentEmployees_EmployeeNumber FOREIGN KEY(EmployeeNumber)
REFERENCES Employees (EmployeeNumber);

ALTER TABLE DepartmentEmployees ADD CONSTRAINT fk_DepartmentEmployees_DepartmentNumber FOREIGN KEY(DepartmentNumber)
REFERENCES Departments (DepartmentNumber);

ALTER TABLE DepartmentManagers ADD CONSTRAINT fk_DepartmentManagers_DepartmentNumber FOREIGN KEY(DepartmentNumber)
REFERENCES Departments (DepartmentNumber);

ALTER TABLE DepartmentManagers ADD CONSTRAINT fk_DepartmentManagers_EmployeeNumber FOREIGN KEY(EmployeeNumber)
REFERENCES Employees (EmployeeNumber);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_TitleID FOREIGN KEY(TitleID)
REFERENCES Titles (TitleID);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_EmployeeNumber FOREIGN KEY(EmployeeNumber)
REFERENCES Employees (EmployeeNumber);

select * from Departments;
select * from DepartmentEmployees;
select * from DepartmentManagers;
select * from Employees;
select * from Salaries;
select * from Titles;

--Data Analysis 1:
select e.EmployeeNumber, e.FirstName, e.LastName, e.Sex, s.Salary
from Employees e
inner join Salaries s 
	on e.EmployeeNumber = s.EmployeeNumber;
	
--Data Analysis 2:
select FirstName, LastName, HireDate
from Employees
where HireDate like '%1986';

--Data Analysis 3:
select e.EmployeeNumber, e.FirstName, e.LastName, d.DepartmentName, d.DepartmentNumber
from DepartmentManagers dm
inner join Employees e
	on dm.EmployeeNumber = e.EmployeeNumber
inner join Departments d
	on d.DepartmentNumber = dm.DepartmentNumber;

--Data Analysis 4:
select e.EmployeeNumber, e.FirstName, e.LastName, d.DepartmentName, d.DepartmentNumber
from Employees e
inner join DepartmentEmployees de
	on e.EmployeeNumber = de.EmployeeNumber
inner join Departments d
	on de.DepartmentNumber = d.DepartmentNumber;

--Data Analysis 5:
select FirstName, LastName, Sex
from Employees
where FirstName = 'Hercules' and LastName like 'B%';

--Data Analysis 6:
select e.EmployeeNumber, e.FirstName, e.LastName
from Employees e
inner join DepartmentEmployees de
	on e.EmployeeNumber = de.EmployeeNumber
where de.DepartmentNumber = 'd007'; 
--'d007' is the department number corresponding to the Sales department.

--Data Analysis 7:
select e.EmployeeNumber, e.FirstName, e.LastName, d.DepartmentName
from Employees e
inner join DepartmentEmployees de
	on e.EmployeeNumber = de.EmployeeNumber
inner join Departments d
	on de.DepartmentNumber = d.DepartmentNumber
where de.DepartmentNumber = 'd007' or de.DepartmentNumber = 'd005';
--'d007' and 'd005' are the department numbers for Sales and Development respectively.

--Data Analysis 8:
select LastName, count(*) as counts
from Employees
group by LastName
order by counts desc;
