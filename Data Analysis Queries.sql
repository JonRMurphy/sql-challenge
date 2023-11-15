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