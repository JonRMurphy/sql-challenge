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