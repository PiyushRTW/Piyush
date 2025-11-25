create database test
use test

create table Employees
(EmployeeID varchar(5) primary key,
FirstName varchar(30),
LastName varchar(30),
DepartmentID varchar(5),
Salary Money check(Salary>0),
HireDate Date not null)


insert into Employees values
('E001','Ramesh','Kumar','D1',150000,'01-04-2022'),
('E002','Suresh','Prasad','D2',160000,'02-09-2014'),
('E003','Jayesh','Desai','D1',70000,'01-04-2020'),
('E004','Hitesh','Joshi','D1',180000,'02-09-2023'),
('E005','Amit','Mehta','D1',20000,'01-04-2024'),
('E006','Rajesh','Shetty','D2',130000,'02-09-2019'),
('E007','Raj','Patel','D1',50000,'01-04-2022'),
('E008','Mitesh','Kumar','D4',170000,'02-09-2021'),
('E009','Rohit','Gupta','D1',60000,'02-09-2021'),
('E010','Rahul','Sharma','D2',45000,'02-09-2019')

delete Employees

--Write a query to find all employees whose salary is greater than the average salary
--of all employees.
select FirstName, Salary from Employees where salary>(select avg(salary) from Employees)

--2. Write a query to find the total number of employees hired in each year.
select count(*), HireDate from Employees group by HireDate

--3. Write a query to find the average salary of employees in each department, but only
--include departments with more than 5 employees.
select avg(salary) as average, DepartmentID from Employees group by DepartmentID having count(EmployeeID)>5

--4. Write a query to find all employees who were hired in the last 3 years and have a
--salary greater than 50,000.
select FirstName, Salary, HireDate from Employees where HireDate>='2022' and Salary>50000


--5. Write a query to find the total salary paid to employees in each department, but only
--include departments where the total salary is greater than 500,000.
select sum(salary) as Total, departmentID from Employees group by DepartmentID having sum(salary)>500000


--6. Write a query to find departments with more than 10 employees.
select DepartmentID,count(EmployeeID) as 'number of employees' from employees group by DepartmentID having count(EmployeeID)>10

--7. Write a query to find employees who have been with the company for more than 10
--years and have a salary greater than 60,000.
select FirstName, HireDate, Salary from employees where HireDate<'02-14-2015' and salary>60000

--8. Write a query to find departments with an average salary greater than 70,000.
select DepartmentID, avg(Salary) from Employees group by DepartmentID having avg(salary)>70000


--9. Write a query to find the total number of employees in each department.
select DepartmentID,count(*) as 'number of employees' from employees group by DepartmentID

--10. Write a query to find the highest salary among all employees
select max(salary) as HighestSalary from employees
